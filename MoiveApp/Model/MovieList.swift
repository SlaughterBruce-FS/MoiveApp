//
//  MovieList.swift
//  MoiveApp
//
//  Created by J C on 11/12/23.
//

import Foundation

struct MovieList: Codable, Identifiable {
    let id, page: Int
    let results: [Result]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case id, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Result: Codable {
    let description: String
    let favoriteCount, id, itemCount: Int
    let iso639_1: ISO639_1
    let iso3166_1: ISO3166_1
    let listType: ListType
    let name: String
    let posterPath: JSONNull?

    enum CodingKeys: String, CodingKey {
        case description
        case favoriteCount = "favorite_count"
        case id
        case itemCount = "item_count"
        case iso639_1 = "iso_639_1"
        case iso3166_1 = "iso_3166_1"
        case listType = "list_type"
        case name
        case posterPath = "poster_path"
    }
}

enum ISO3166_1: String, Codable {
    case us = "US"
}

enum ISO639_1: String, Codable {
    case en = "en"
}

enum ListType: String, Codable {
    case movie = "movie"
}





