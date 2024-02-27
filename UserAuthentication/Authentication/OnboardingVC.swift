//
//  OnboardingVC.swift
//  UserAuthentication
//
//  Created by Faseeh pm on 26/02/24.
//

import UIKit

class OnboardingVC: UIViewController {
    
    static func instantiate() -> OnboardingVC{
        guard let onboardingView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OnboardingVC") as? OnboardingVC
        else{ fatalError("Unexpetedly failed getting onboardingView from storyboard")}
        return onboardingView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        let loginView = LoginVC.instantiate()
        self.navigationController?.pushViewController(loginView, animated: true)
    }
    @IBAction func registerTapped(_ sender: Any) {
        let registerView = RegisterVC.instantiate()
        self.navigationController?.pushViewController(registerView, animated: true)
    }
    
}
