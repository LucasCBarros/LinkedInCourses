//
//  LibraryViewController.swift
//  FilmFest
//
//  Created by Lucas C Barros on 2024-10-17.
//

import UIKit

class LibraryViewController: UIViewController {

    @IBOutlet weak var libraryTableView: UITableView!
    @IBOutlet var dataService: MovieLibraryDataService!
    
    var movieManager = MovieManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.libraryTableView.dataSource = dataService
        self.libraryTableView.delegate = dataService
        
        dataService.movieManager = movieManager
        
        dataService.movieManager?.addMovie(movie: Movie(title: "Action", releaseDate: "1991"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Horror", releaseDate: "1921"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Crime", releaseDate: "1500"))
        
        libraryTableView.reloadData()
    }


}

