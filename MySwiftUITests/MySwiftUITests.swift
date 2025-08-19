//
//  MySwiftUITests.swift
//  MySwiftUITests
//
//  Created by Mario Andres Heberthardt Marchant on 12/9/24.
//

import XCTest
@testable import MySwiftUI

/// Test suite for the movie app's core functionality
final class MySwiftUITests: XCTestCase {
    
    /// Mock persistence that returns successful responses
    var successMock: MockSuccessPersistence!
    
    /// Mock persistence that returns failures for all requests
    var failingMock: MockFailingPersistence!
    
    /// Set up test environment before each test
    ///
    /// Creates fresh instances of the mock persistence classes
    override func setUp() {
        super.setUp()
        successMock = MockSuccessPersistence()
        failingMock = MockFailingPersistence()
    }
    
    /// Clean up test environment after each test
    ///
    /// Releases all mock objects to prevent memory leaks
    override func tearDown() {
        successMock = nil
        failingMock = nil
        super.tearDown()
    }
    
    /// Tests that genre IDs are correctly mapped to their names
    ///
    /// Verifies that the view model can convert genre IDs to a comma-separated string of genre names
    func testGetGenreReturnsCorrectNames() {
        let genres = [Genre(id: 1, name: "Action"), Genre(id: 2, name: "Comedy")]
        let vm = MoviesVM(movies: [], genres: genres)
        let result = vm.getGenre(generos: [1, 2])
        XCTAssertEqual(result, "Action, Comedy")
    }
    
    /// Tests error handling when movie fetching fails
    ///
    /// Verifies that the view model correctly sets the error property when the network request fails
    func testErrorIsSetWhenFetchingMoviesFails() async {
        // Given
        let vm = MoviesVM(movies: [], genres: [], persistence: failingMock)
        
        // When
        await vm.getMovies()
        
        // Then
        XCTAssertNotNil(vm.error, "Error should be set when fetching movies fails")
    }
    
    /// Tests successful movie data fetching
    ///
    /// Verifies that the view model correctly processes movies when the network request succeeds
    func testSuccessfulMoviesFetch() async {
        // Given
        let vm = MoviesVM(movies: [], genres: [], persistence: successMock)
        
        // When
        await vm.getMovies()
        
        // Then
        XCTAssertNil(vm.error, "No error should be present on successful fetch")
        XCTAssertEqual(vm.movies.count, 1, "Should fetch one movie")
        XCTAssertEqual(vm.movies.first?.title, "Black Adam")
    }
}
