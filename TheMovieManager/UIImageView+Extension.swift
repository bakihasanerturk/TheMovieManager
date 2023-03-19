//
//  UIImageView+Extension.swift
//  TheMovieManager
//
//  Created by Baki Hasan Ertürk on 18.03.2023.
//

import UIKit

extension UIImageView{
    func imgLoad(url: URL){
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
