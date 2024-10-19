//
//  MovieManagerTests.swift
//  FilmFestTests
//
//  Created by Lucas C Barros on 2024-10-17.
//

import XCTest
@testable import FilmFest

final class MovieManagerTests: XCTestCase {
    
    var sut: MovieManager!
    
    let actionMovie = Movie(title: "KungFu Panda")
    let sciFiMovie = Movie(title: "Matrix")
    let dramaMovie = Movie(title: "Game of Thrones")

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = MovieManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: Initial Values
    func testInit_MoviesToSee_ReturnsZero() {
//        let sut = MovieManager()
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func testInit_MoviesSeen_ReturnsZero() {
//        let sut = MovieManager()
        
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    // MARK: Add & Query
    func testAdd_MoviesToSee_ReturnsOne() {
//        let testMovie = Movie(title: "KungFu Panda")
        sut.addMovie(movie: sciFiMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func testQuery_ReturnsMovieAtIndex() {
//        let testMovie = Movie(title: "Jurassic Park")
        sut.addMovie(movie: dramaMovie)
        
        let movieQueried = sut.movieAtIndex(index: 0)
        XCTAssertEqual(dramaMovie.title, movieQueried.title)
    }
    
    // MARK: Checking Off
    func testCheckOffMovie_UpdatesMovieManagerCounts() {
//        let testMovie = Movie(title: "Adventure")
        sut.addMovie(movie: actionMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesSeenCount, 1)
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func testCheckOffMovie_RemovesMovieFromArray() {
        sut.addMovie(movie: actionMovie)
        sut.addMovie(movie: dramaMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.movieAtIndex(index: 0).title, dramaMovie.title)
    }
    
    func testCheckOffMovie_ReturnsMovieAtIndex() {
        sut.addMovie(movie: actionMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        let movieQueried = sut.checkedOffMovieAtIndex(index: 0)
        XCTAssertEqual(movieQueried.title, actionMovie.title)
    }

    // MARK: Clear Arrays
    func testClearArrays_ReturnsArrayCountsOfZero() {
        sut.addMovie(movie: actionMovie)
        sut.addMovie(movie: dramaMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesSeenCount, 1)
        XCTAssertEqual(sut.moviesToSeeCount, 1)
        
        sut.clearArrays()
        
        XCTAssertEqual(sut.moviesSeenCount, 0)
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    // MARK: Duplicates
    func testDuplicatedMovies_ShouldNotBeAddedToArray() {
        sut.addMovie(movie: actionMovie)
        sut.addMovie(movie: actionMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
}
