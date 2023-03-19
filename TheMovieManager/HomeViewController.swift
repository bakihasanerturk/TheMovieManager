//
//  HomeViewController.swift
//  TheMovieManager
//
//  Created by Baki Hasan Ertürk on 16.03.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var movieSearch: UISearchBar!
    @IBOutlet weak var movieList: UITableView!
    
    var service: ServiceManager = ServiceManager()
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieSearch.delegate = self

    }
    
    // MARK: Load Data
    func load(search: String){
        service.fetchMovies(paramaters: ["query" : search]) { [weak self] (response) in
            switch response{
            case .success(let data):
                self?.movies = data.results
                self?.movieList.reloadData()
            case .failure(let error):
                print("Hata \(error)")
            }
        }
    }
}

// MARK: Search
extension HomeViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count >= 3{
            load(search: searchText.lowercased())
        }else{
            self.movies = []
            movieList.reloadData()
        }
    }
}

// MARK: TableView Settings
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count > 0 ? movies.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if movies.count == 0 {
            let cell = movieList.dequeueReusableCell(withIdentifier: "EmptyCell", for: indexPath) as! EmptyTableViewCell
            return cell
        }else{
            let cell = movieList.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
            print("\(cell.movieTitle.text = movies[indexPath.row].title) - \(cell.date.text = movies[indexPath.row].releaseDate)")
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovie = movies[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        vc.movie = selectedMovie
        show(vc, sender: nil)
        
    }
}

