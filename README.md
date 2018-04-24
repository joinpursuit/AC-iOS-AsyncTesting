## Testing Asynchronous calls 

Sample app to test asynchronous network calls.

```swift 
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
```

[Apple Documentation](https://developer.apple.com/documentation/xctest/asynchronous_tests_and_expectations/testing_asynchronous_operations_with_expectations)
