//
//  AppGroup.swift
//  AppstoreApp
//
//  Created by Nicolas Monzon on 23/03/2022.
//

import Foundation

struct AppGroup: Decodable {
    
    let feed: Feed
}

struct Feed: Decodable {
    
    let title:      String
    let results:    [FeedResult]
}

struct FeedResult: Decodable {
    
    let artistName:     String
    let artworkUrl100:  String
    let name:           String
}
