//
//  Server.swift
//  UserAuthentication
//
//  Created by faseeh-pixbit on 04/03/24.
//

import Foundation
import Alamofire

struct ServerResponse<T: Codable>: Codable {
    let errors: Errors?
    let message: String?
    let data: T?
}

struct Errors: Codable {
    let name: String?
    let id: String?
    let email: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case id = "id"
        case email = "email"
    }
}

struct ServerURL{
    static let baseUrl = "baseUrl"  //Yours
    static let register = baseUrl + "/register" // Yours
    static let logIn = baseUrl + "/login" // Yours
}

struct ServerApiCall {
    //Server request
    static func serverRequest<T: Decodable>(requrl: String, parameter: [String:Any] = [:], method: HTTPMethod, viewController: UIViewController, enableTransperentSpinner: Bool = false, enablePrimarySpinner: Bool = false, view: UIView, isNoNetWork: Bool = false, completionHandler: @escaping (_ result: T?, _ statusCode: Int?) -> Void) {

        if Connectivity.isConnectedToInternet() {
            //Add spinner here
            var headers: HTTPHeaders?
            if AppUserDefaults.accessToken != nil {
                headers = HTTPHeaders(["Accept": "application/json","Authorization": "Bearer " + AppUserDefaults.accessToken!])
            } else {
                headers = HTTPHeaders(["Accept": "application/json"])
            }

            AF.request(requrl, method: method, parameters: parameter, encoding: URLEncoding.queryString, headers: headers).validate(statusCode: 200..<201)
                .responseDecodable(of: T.self) { response in
                print("response: \(response)")

                switch response.result {
                    case .success(let value):
                        if let retrievedData = response.data{
                            let str = String(decoding: retrievedData, as: UTF8.self)
                            print(str)
                            completionHandler(value, response.response?.statusCode)
                        }
                        //remove spinner here

                    case .failure(_):
                        completionHandler(nil, response.response?.statusCode)
                        self.manageErrorStatusCode(response: response, viewController: viewController)
                        //remove spinner here
                    
                }
            }
        }else{
            print("No internet connection")
        }
    }

    static func manageErrorStatusCode<T>(response: AFDataResponse<T>, viewController: UIViewController) {
        switch response.response?.statusCode {
        case 400, 401, 403, 404, 405, 429:
            viewController.alertServerMessage(data: response.data)

        case 422: // validation Error
            viewController.alertErrorServerValidation(data: response.data)

        default:
            viewController.alert(message: "Unable to connect to server")
        }
    }

}
