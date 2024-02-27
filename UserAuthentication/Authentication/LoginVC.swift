//
//  LoginVC.swift
//  UserAuthentication
//
//  Created by Faseeh pm on 26/02/24.
//

import UIKit

class LoginVC: UIViewController {
    static func instantiate() -> LoginVC{
        guard let loginView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
        else{fatalError("Unexpectedly failed getting loginVC from storyboard")}
        return loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginTapped(_ sender: Any) {
        let homeView = HomeVC.instantiate()
        self.navigationController?.pushViewController(homeView, animated: true)
    }
    
}
