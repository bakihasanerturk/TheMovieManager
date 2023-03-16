//
//  ViewController.swift
//  TheMovieManager
//
//  Created by Baki Hasan Ertürk on 16.03.2023.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    var userEmail = "b"
    var userPassword = "1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        if userEmail == emailText.text && userPassword == passwordText.text{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeViewController
            show(vc, sender: nil)
            
        }else{
            print("Error !")
        }
    }
}

