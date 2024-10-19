//
//  MovieLibraryDataService.swift
//  FilmFest
//
//  Created by Lucas C Barros on 2024-10-18.
//

import UIKit

enum LibrarySection: Int {
    case MoviesToSee, MoviesSeen
}

class MovieLibraryDataService: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var movieManager: MovieManager?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let movieManager else { return 0 }
        guard let librarySection = LibrarySection(rawValue: section) else { fatalError() }
        
        switch librarySection {
        case .MoviesSeen:
            return movieManager.moviesSeenCount
        case .MoviesToSee:
            return movieManager.moviesToSeeCount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let movieManager else { fatalError() }
        guard let librarySection = LibrarySection(rawValue: indexPath.section) else { fatalError() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellID", for: indexPath) as! MovieCell
        
        let movieData = librarySection.rawValue == 0
        ? movieManager.movieAtIndex(index: indexPath.row)
        : movieManager.checkedOffMovieAtIndex(index: indexPath.row)
        
        cell.configMovieCell(movie: movieData)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movieManager else { fatalError() }
        guard let librarySection = LibrarySection(rawValue: indexPath.row) else { fatalError() }
        
        if librarySection == .MoviesToSee {
            self.movieManager?.checkOffMovieAtIndex(index: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        guard let librarySection = LibrarySection(rawValue: section) else { fatalError() }
        
        let sectionTitle = librarySection.rawValue == 0 ? "Movies To See" : "Movies Seen"
        
        return sectionTitle
    }
}
