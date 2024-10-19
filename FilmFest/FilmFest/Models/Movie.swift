//
//  Movie.swift
//  FilmFest
//
//  Created by Lucas C Barros on 2024-10-17.
//

import Foundation

struct Movie: Equatable {
    let title: String
    let releaseDate: String?
    
    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
}

func == (lhs: Movie, rhs: Movie) -> Bool {
    if lhs.title != rhs.title {
        return false
    } else {
        if lhs.releaseDate != rhs.releaseDate {
            return false
        } else {
            return true
        }
    }
}
