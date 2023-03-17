//
//  HomeViewController.swift
//  TheMovieManager
//
//  Created by Baki Hasan Ertürk on 16.03.2023.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func backToHomeButton(_ sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
    }

}
