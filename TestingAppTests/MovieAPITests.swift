//
//  MovieAPITests.swift
//  TestingAppTests
//
//  Created by Alex Paul on 4/24/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import XCTest
@testable import TestingApp

class MovieAPITests: XCTestCase {
    
    func testMovieAPI() {
        // create an expectation for a background task
        let exp = expectation(description: "movie results received")
        
        var search: MovieSearch!
        
        MovieAPI.searchMovies(keyword: "") { (error, data) in
            if let error = error {
                XCTFail("movie search error: \(error)")
            } else if let data = data {
                do {
                    let decoder = JSONDecoder()
                    search = try decoder.decode(MovieSearch.self, from: data)
                    
                    // fulfill to indicate task is complete
                    exp.fulfill()
                } catch {
                    XCTFail("decoding error: \(error)")
                }
            }
        }
        
        // async call so we need to wait until the expectation is fulfilled
        wait(for: [exp], timeout: 3.0)
        XCTAssertGreaterThan(search.results.count, 0, "movie count should be greater than 0")
    }
    
    func testMovieExist() {
        let exp = expectation(description: "movie results received")
        var search: MovieSearch!
        MovieAPI.searchMovies(keyword: "") { (error, data) in
            if let error = error {
                XCTFail("movie search error: \(error)")
            } else if let data = data {
                do {
                    let decoder = JSONDecoder()
                    search = try decoder.decode(MovieSearch.self, from: data)
                    
                    // fulfill to indicate task is complete
                    exp.fulfill()
                } catch {
                    XCTFail("decoding error: \(error)")
                }
            }
        }
        // async call so we need to wait until the expectation is fulfilled
        wait(for: [exp], timeout: 3.0)
        
        XCTAssertEqual(search.results[0].trackName, "Blue Collar Comedy Tour: One for the Road", "movie does not exist")
    }
    
}
