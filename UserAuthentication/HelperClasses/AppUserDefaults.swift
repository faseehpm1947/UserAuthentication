//
//  AppUserDefaults.swift
//  UserAuthentication
//
//  Created by faseeh-pixbit on 27/02/24.
//

import Foundation
class  AppUserDefaults: UserDefaults{
    
    enum Keys{
        static let accessTokenKey =  "accessToken"
        
    }
    static var accessToken: Bool? {
        get{
            return UserDefaults.standard.bool(forKey: AppUserDefaults.Keys.accessTokenKey)
        }
        
        set(newValue){
            UserDefaults.standard.set(newValue, forKey: AppUserDefaults.Keys.accessTokenKey)
        }
    }
  
}
