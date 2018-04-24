//
//  Movie.swift
//  TestingApp
//
//  Created by Alex Paul on 4/24/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import Foundation

struct MovieSearch: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let trackName: String
    let artistName: String
}
