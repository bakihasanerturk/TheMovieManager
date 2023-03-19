//
//  ServiceHelper.swift
//  TheMovieManager
//
//  Created by Baki Hasan Ertürk on 18.03.2023.
//

import Foundation
import Alamofire

// MARK: Http Methods
enum HTTPMethods: String{
    case get = "GET"
    case post = "POST"
}


// MARK: Error
enum Error: Swift.Error{
    case serializationError(internal: Swift.Error)
    case networkError(internal: Swift.Error)
}

// MARK: EndPoint
struct ServiceEndPoint{
    static let baseURL: String = "https://api.themoviedb.org/3/search/movie"
    static let apiKey: String = "60b87c964abe45c9b6a0f56dc5df2e3f"
    static let nowPlaying: String = "now_playing"
}

class ServiceHelper{
    static let shared = ServiceHelper()
    
    let headers: HTTPHeaders = [
        "Content-Type": "application/json;charset=utf-8"
    ]
}
