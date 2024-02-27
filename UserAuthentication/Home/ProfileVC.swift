//
//  ProfileVC.swift
//  UserAuthentication
//
//  Created by faseeh-pixbit on 27/02/24.
//

import UIKit

class ProfileVC: UIViewController {
    static func instantiate() -> ProfileVC{
        guard let profileView = UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "ProfileVC") as? ProfileVC
        else{fatalError("Unexpectedly failed getting ProfileVC from storyboard")}
        return profileView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func logoutTapped(_ sender: Any) {
        AppUserDefaults.accessToken = false
        let onboardingNavController = OnboardingNavigationController.instantiate()
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(onboardingNavController)
    }
    

}
