//
//  Service.swift
//  AppstoreApp
//
//  Created by Nicolas Monzon on 20/03/2022.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    func fetchGenericData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()) {

        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in

            guard let data = data else {
                print("Failed to retrieve apps data")
                completion(nil, error)
                return
            }

            do {
                let jsonResult = try JSONDecoder().decode(T.self, from: data)
                completion(jsonResult, nil)
            } catch let jsonError {
                print("Failed to decode data", jsonError)
                completion(nil, error)
            }

        }.resume()
    }
}
