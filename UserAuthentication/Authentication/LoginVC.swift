//
//  LoginVC.swift
//  UserAuthentication
//
//  Created by Faseeh pm on 26/02/24.
//

import UIKit
import Alamofire

class LoginVC: UIViewController {
    static func instantiate() -> LoginVC{
        guard let loginView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
        else{fatalError("Unexpectedly failed getting loginVC from storyboard")}
        return loginView
    }
    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var txtFldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginTapped(_ sender: Any) {
        logIn()
    }
    
    func logIn(){
        let url = ServerURL.logIn
        let parameters: Parameters = ["email": txtFldEmail.text ?? "", "password": txtFldPassword.text ?? ""]
        
        ServerApiCall.serverRequest(requrl: url,parameter: parameters, method: .post, viewController: self, enablePrimarySpinner: false, view: self.view, isNoNetWork: true) { (logInResponse: ServerResponse<Register>?, statusCode) in
            
            if let logInResponse = logInResponse {
                if let response = logInResponse.data {
                    // Successfully decoded response data
                    AppUserDefaults.accessToken = response.accessToken
                    let mainTabBarController = MainTabBarController.instantiate()
                    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
                }
            }else {
                // Unable to decode response data
                self.alert(message: "Unable to decode response data.")
            }
        }
    }
        
}
