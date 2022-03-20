//
//  Service.swift
//  AppstoreApp
//
//  Created by Nicolas Monzon on 20/03/2022.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    func fetchItunesData(searchText: String, completion: @escaping ([Result], Error?) -> ()) {
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(searchText)&entity=software") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in

            if let error = error {
                completion([], error)
                return
            }

            guard let data = data else {
                print("Failed to retrieve apps data")
                completion([], nil)
                return
            }

            do {
                let jsonResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(jsonResult.results, nil)
            } catch let jsonError {
                completion([], jsonError)
            }

        }.resume()
    }
}
