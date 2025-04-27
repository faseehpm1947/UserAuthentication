//
//  MainTabBarController.swift
//  UserAuthentication
//
//  Created by faseeh-pixbit on 27/02/24.
//

import UIKit

class MainTabBarController: UITabBarController {
    static func instantiate() -> MainTabBarController{
        guard let mainTabBarControllerView = UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "MainTabBarController") as? MainTabBarController
        else{ fatalError("Unexpectedly failed getting MainTabBarController from storyboard")}
        return mainTabBarControllerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
