//
//  SearchResult.swift
//  autoLayoutPractice
//
//  Created by 石川大輔 on 2021/06/16.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    let averageUserRating: Float?
}
