//
//  ServiceManager.swift
//  TheMovieManager
//
//  Created by Baki Hasan Ertürk on 18.03.2023.
//

import Foundation
import Alamofire

class ServiceManager: ServiceProtocol{
  
    static let shared = ServiceManager()
    init(){}
    
    func fetchMovies(paramaters: [String : String]?, completion: @escaping ((Results<MovieResponse>)) -> ()) {
        
        let url = "\(ServiceEndPoint.baseURL)?api_key=\(ServiceEndPoint.apiKey)"
        
        AF.request(url, method: .get, parameters: paramaters, headers: ServiceHelper.shared.headers).responseData { response in
            switch response.result{
            case .success(let data):
                let decoder = JSONDecoder()
                do{
                    let result = try decoder.decode(MovieResponse.self, from: data)
                    completion(.success(result))
                }catch{
                    completion(.failure(Error.serializationError(internal: error)))
                }
                
            case .failure(let error):
                completion(.failure(Error.networkError(internal: error)))
            }
        }
    }
}
