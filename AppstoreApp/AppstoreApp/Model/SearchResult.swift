//
//  SearchResult.swift
//  AppstoreApp
//
//  Created by Nicolas Monzon on 20/03/2022.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount:    Int
    let results:        [Result]
}

struct Result : Decodable{
    let artworkUrl100:      String
    let primaryGenreName:   String
    let trackName:          String
    let averageUserRating:  Float
    let screenshotUrls:     [String]
    
}
