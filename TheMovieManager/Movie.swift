//
//  Movie.swift
//  TheMovieManager
//
//  Created by Baki Hasan Ertürk on 18.03.2023.
//

import Foundation

// MARK: - MovieResponse
struct MovieResponse: Codable {
    let results: [Movie]
}

// MARK: - Movie
struct Movie: Codable {
    let adult: Bool
    let genreIDS: [Int]
    let id: Int
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String?
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    var movieImage: String{
        if posterPath == nil{
            return "https://www.themoviedb.org/assets/2/v4/logos/v2/blue_square_2-d537fb228cf3ded904ef09b136fe3fec72548ebc1fea3fbbd1ad9e36364db38b.svg"
        }else{
            return "https://image.tmdb.org/t/p/w500/\(posterPath ?? "")"
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case adult
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

