//
//  Pagination.swift
//  UserAuthentication
//
//  Created by faseeh-pixbit on 11/03/24.
//

import Foundation

struct PaginationResponse<T: Codable>: Codable {
    var data: T?
    var from: Int?
    var perPage: Int?
    var to: Int?
    var links: Links?
    var meta: Meta?
    
    private enum CodingKeys: String, CodingKey {
        case data
        case from
        case perPage = "per_page"
        case to
        case links = "links"
        case meta
    }
}

struct Links: Codable {
    var nextPage: String?
    
    private enum CodingKeys: String, CodingKey {
        case nextPage = "next"
    }
}

struct Meta: Codable {
    var currentPage: Int?
    var lastPage: Int?
    
    private enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case lastPage = "last_page"
    }
}
