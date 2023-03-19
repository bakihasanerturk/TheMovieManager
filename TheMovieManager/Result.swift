//
//  Result.swift
//  TheMovieManager
//
//  Created by Baki Hasan Ertürk on 18.03.2023.
//

import Foundation

// MARK: Results
enum Results<Value>{
    case success(Value)
    case failure(Error)
}
