//
//  MovieResponse.swift
//  MoiveApp
//
//  Created by J C on 11/11/23.
//

import Foundation

struct MovieResponse: Codable {
    let dates: Dates?
    let page: Int
    let results: [Movie]

    struct Dates: Codable {
        let maximum: String
        let minimum: String
    }
}

