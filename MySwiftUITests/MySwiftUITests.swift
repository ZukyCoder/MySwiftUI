//
//  MySwiftUITests.swift
//  MySwiftUITests
//
//  Created by Mario Andres Heberthardt Marchant on 12/9/24.
//

import XCTest
@testable import MySwiftUI

final class MySwiftUITests: XCTestCase {
    
    func test_MoviesVM_ShouldFetchData() async {
        let sut =  MoviesVM()
        await sut.getMovies()
        
        XCTAssertNotNil(sut.movies)
    }
    
    func test_mock() {
        XCTAssertEqual(2, 2)
        XCTAssertEqual(3, 3)
    }

}
