//
//  ServiceProtocol.swift
//  TheMovieManager
//
//  Created by Baki Hasan Ertürk on 18.03.2023.
//

import Foundation
import Alamofire

// MARK: Service Protocol
protocol ServiceProtocol{
    func fetchMovies(paramaters: [String: String]?, completion: @escaping((Results<MovieResponse>)) -> ())
}
