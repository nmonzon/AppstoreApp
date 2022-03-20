//
//  SearchResultViewModel.swift
//  AppstoreApp
//
//  Created by Nicolas Monzon on 20/03/2022.
//

import Foundation

struct SearchResultViewModel {
    
    let appName:        String
    let rating:         String
    let screenShoot1:   String
    let screenShoot2:   String
    let screenShoot3:   String
    let appLogo:        String
    let category:       String
    
    init(result: Result) {
        category = result.primaryGenreName
        appName = result.trackName
        rating = "Rating \(result.averageUserRating)"
        appLogo = result.artworkUrl100
        
        screenShoot1 = result.screenshotUrls[0]
        screenShoot2 = result.screenshotUrls.count > 1 ? result.screenshotUrls[1] : ""
        screenShoot3 = result.screenshotUrls.count > 2 ? result.screenshotUrls[2] : ""
    }
}
