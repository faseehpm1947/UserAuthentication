//
//  RegisterVC.swift
//  UserAuthentication
//
//  Created by Faseeh pm on 26/02/24.
//

import UIKit

class RegisterVC: UIViewController {
    static func instantiate() -> RegisterVC{
        guard let regiterView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegisterVC") as? RegisterVC
        else{fatalError("Unexpectedly failed to getting RegisterVC from storyboard")}
        return regiterView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
