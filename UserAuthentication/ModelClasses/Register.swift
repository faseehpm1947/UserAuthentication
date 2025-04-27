//
//  Register.swift
//  UserAuthentication
//
//  Created by faseeh-pixbit on 04/03/24.
//

import Foundation
struct Register: Codable {
    let accessToken: String?
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
       
    }
}
