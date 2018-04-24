//
//  MovieAPI.swift
//  TestingApp
//
//  Created by Alex Paul on 4/24/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import Foundation

struct MovieAPI {
    static let urlSession = URLSession(configuration: .default)
    static let urlRequest = URLRequest(url: URL(string:"https://itunes.apple.com/search?media=movie&term=comedy&limit=10")!)
    
    static func searchMovies(keyword: String, completion: @escaping (Error? ,Data?) -> Void) {
        urlSession.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                completion(error, nil)
            } else if let data = data {
                completion(nil, data)
            }
        }.resume()
    }
}
