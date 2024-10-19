//
//  MovieManager.swift
//  FilmFest
//
//  Created by Lucas C Barros on 2024-10-17.
//

import Foundation

struct MovieManager {
    var moviesToSeeCount: Int { return moviesToSeeArray.count }
    var moviesSeenCount: Int { return moviesSeenArray.count }
    
    private var moviesToSeeArray = [Movie]()
    private var moviesSeenArray = [Movie]()
    
    mutating func addMovie(movie: Movie) {
        if !moviesToSeeArray.contains(movie) {
            moviesToSeeArray.append(movie)
        }
        
    }
    
    func movieAtIndex(index: Int) -> Movie {
        return moviesToSeeArray[index]
    }
    
    mutating func checkOffMovieAtIndex(index: Int) {
        
        guard index < moviesToSeeCount else { return }
        
        let checkedMovie = self.moviesToSeeArray.remove(at: index)
        self.moviesSeenArray.append(checkedMovie)
    }
    
    func checkedOffMovieAtIndex(index: Int) -> Movie {
        return moviesSeenArray[index]
    }
    
    mutating func clearArrays() {
        moviesSeenArray.removeAll()
        moviesToSeeArray.removeAll()
    }
}
