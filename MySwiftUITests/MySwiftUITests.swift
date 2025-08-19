//
//  MySwiftUITests.swift
//  MySwiftUITests
//
//  Created by Mario Andres Heberthardt Marchant on 12/9/24.
//

import XCTest
@testable import MySwiftUI

final class MySwiftUITests: XCTestCase {
        
        var successMock: MockSuccessPersistence!
        var failingMock: MockFailingPersistence!
        
        override func setUp() {
            super.setUp()
            successMock = MockSuccessPersistence()
            failingMock = MockFailingPersistence()
        }
        
        override func tearDown() {
            successMock = nil
            failingMock = nil
            super.tearDown()
        }
        
        func testGetGenreReturnsCorrectNames() {
            let genres = [Genre(id: 1, name: "Action"), Genre(id: 2, name: "Comedy")]
            let vm = MoviesVM(movies: [], genres: genres)
            let result = vm.getGenre(generos: [1, 2])
            XCTAssertEqual(result, "Action, Comedy")
        }
        
    func testErrorIsSetWhenFetchingMoviesFails() async {
            // Given
            let vm = MoviesVM(movies: [], genres: [], persistence: failingMock)
            
            // When
            await vm.getMovies()
            
            // Then
            XCTAssertNotNil(vm.error, "Error should be set when fetching movies fails")
        }
        
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
