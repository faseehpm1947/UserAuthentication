//
//  RegisterVC.swift
//  UserAuthentication
//
//  Created by Faseeh pm on 26/02/24.
//

import UIKit
import Alamofire

class RegisterVC: UIViewController {
    static func instantiate() -> RegisterVC{
        guard let regiterView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegisterVC") as? RegisterVC
        else{fatalError("Unexpectedly failed to getting RegisterVC from storyboard")}
        return regiterView
    }
   
    @IBOutlet weak var txtFldName: UITextField!
    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var txtFldPassword: UITextField!
    @IBOutlet weak var txtFldConfirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func regiterTapped(_ sender: Any) {
        register()
    }
    
    func register(){
        let url = ServerURL.register
        let parameters: Parameters = ["name": txtFldName.text ?? "", "email": txtFldEmail.text ?? "", "password": txtFldPassword.text ?? "", "password_confirmation": txtFldConfirmPassword.text ?? ""]
        
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
