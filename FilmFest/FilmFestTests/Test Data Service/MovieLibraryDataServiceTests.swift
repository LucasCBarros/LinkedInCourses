//
//  MovieLibraryDataServiceTests.swift
//  FilmFestTests
//
//  Created by Lucas C Barros on 2024-10-18.
//

import XCTest
@testable import FilmFest

final class MovieLibraryDataServiceTests: XCTestCase {
    
    var sut: MovieLibraryDataService!
    var libraryTableView: UITableView!
    var libraryVC: LibraryViewController!
    
    var tableViewMock: TableViewMock!
    
    let faityTale = Movie(title: "Shrek")
    let pirateMovie = Movie(title: "Jack")
    let fastMovie = Movie(title: "Fast & Furious")

    override func setUpWithError() throws {
        
        sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()
        
        tableViewMock = TableViewMock.initMock(dataSource: sut)
        
        libraryVC = UIStoryboard(name: "Main",
                                 bundle: nil)
        .instantiateViewController(withIdentifier: "LibraryViewControllerID") as? LibraryViewController
        _ = libraryVC.view
        
        libraryTableView = libraryVC.libraryTableView
        libraryTableView.dataSource = sut
        libraryTableView.delegate = sut
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: Sections
    func testTableViewSections_Count_ReturnsTwo() {
//        let dataService = MovieLibraryDataService()
//        let table = UITableView()
//        table.dataSource = dataService
        
        let sections = libraryTableView.numberOfSections
        XCTAssertEqual(sections, 2)
    }
    
    func testTableViewSections_SectionOne_ReturnsMoviesToSeeCount() {
//        sut.movieManager?.addMovie(movie: faityTale)
//        sut.movieManager?.addMovie(movie: pirateMovie)
//        
//        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 2)
//        
//        sut.movieManager?.addMovie(movie: fastMovie)
//        libraryTableView.reloadData()
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 3)
    }
    
    func testTableViewSections_SectionTwo_ReturnsMoviesSeenCount() {
//        sut.movieManager?.addMovie(movie: faityTale)
//        sut.movieManager?.addMovie(movie: pirateMovie)
//        sut.movieManager?.checkOffMovieAtIndex(index: 0)
//        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
//        
//        sut.movieManager?.checkOffMovieAtIndex(index: 0)
//        libraryTableView.reloadData()
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 0)
        
    }
    
    // MARK: Cells
    func testCell_RowAtIndex_ReturnsMovieCell() {
        sut.movieManager?.addMovie(movie: faityTale)
        libraryTableView.reloadData()
        
        let cellQueried = libraryTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(cellQueried is MovieCell)
    }
    
    func testCell_ShouldDequeueCell() {
//        let mock = TableViewMock()
//        mock.dataSource = sut
//        mock.register(MovieCell.self, forCellReuseIdentifier: "movieCellID")
        
//        sut.movieManager?.addMovie(movie: pirateMovie)
//        mock.reloadData()
//        _ = mock.cellForRow(at: IndexPath(row: 0, section: 0))
//        
//        XCTAssertTrue(mock.cellDequeuedProperly)
        
        sut.movieManager?.addMovie(movie: pirateMovie)
        tableViewMock.reloadData()
        _ = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(tableViewMock.cellDequeuedProperly)
    }
    
    func testCell_SectionOneConfig_ShouldSetCellData() {
//        let mock = TableViewMock()
//        mock.dataSource = sut
//        mock.register(MovieCellMock.self, forCellReuseIdentifier: "movieCellID")
        
//        sut.movieManager?.addMovie(movie: pirateMovie)
//        mock.reloadData()
//        
//        let cell = mock.cellForRow(at: IndexPath(row: 0, section: 0)) as! MovieCellMock
        
        sut.movieManager?.addMovie(movie: pirateMovie)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0)) as! MovieCellMock
    }
    
    func testCell_SectionTwoConfig_ShouldSetCellData() {
        sut.movieManager?.addMovie(movie: pirateMovie)
        sut.movieManager?.addMovie(movie: fastMovie)
        sut.movieManager?.checkOffMovieAtIndex(index: 0)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 1)) as! MovieCellMock
        XCTAssertEqual(cell.movieData, pirateMovie)
    }
    
    func testCell_Selection_ShouldCheckOffSelectedMovie() {
        sut.movieManager?.addMovie(movie: pirateMovie)
        sut.movieManager?.addMovie(movie: fastMovie)
        libraryTableView.delegate?.tableView?(libraryTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(sut.movieManager?.moviesToSeeCount, 1)
        XCTAssertEqual(sut.movieManager?.moviesSeenCount, 1)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
    }
    
    func testTableViewSectionTitles_ShouldHaveCorrectStringValue() {
        let section1Title = libraryTableView.dataSource?.tableView?(libraryTableView, titleForHeaderInSection: 0)
        let section2Title = libraryTableView.dataSource?.tableView?(libraryTableView, titleForHeaderInSection: 1)
        
        XCTAssertEqual(section1Title, "Movies To See")
        XCTAssertEqual(section2Title, "Movies Seen")
    }
    
}
