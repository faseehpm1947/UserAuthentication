//
//  InternetConnectivity.swift
//  UserAuthentication
//
//  Created by faseeh-pixbit on 04/03/24.
//

import Foundation
import Alamofire

class Connectivity {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
