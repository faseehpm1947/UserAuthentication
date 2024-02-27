//
//  LoginNavigationController.swift
//  UserAuthentication
//
//  Created by faseeh-pixbit on 27/02/24.
//

import UIKit

class OnboardingNavigationController: UINavigationController {
    static func instantiate() -> OnboardingNavigationController{
        guard let onboardingNavControllerView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OnboardingNavigationController") as? OnboardingNavigationController
        else{ fatalError("Unexpectedly failed getting OnboardingNavigationController from storyboard")}
        return onboardingNavControllerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
