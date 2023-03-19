//
//  DetailViewController.swift
//  TheMovieManager
//
//  Created by Baki Hasan Ertürk on 17.03.2023.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var imdb: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var overView: UILabel!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let movie = movie{
            updateDetail(movie: movie)
        }
        func updateDetail(movie: Movie){
            title = movie.title
            detailImage.imgLoad(url: URL(string: movie.movieImage)!)
            imdb.text = String(movie.voteAverage)
            date.text = movie.releaseDate
            detailTitle.text = movie.title
            overView.text = movie.overview
        }
    }
}
