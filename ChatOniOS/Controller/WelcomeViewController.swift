//
//  ViewController.swift
//  ChatOniOS
//
//  Created by Omar Aldair Romero Pérez on 11/9/18.
//  Copyright © 2018 Omar Aldair Romero Pérez. All rights reserved.
//

import UIKit
import Firebase

class WelcomeViewController: UIViewController {
    
    
    @IBOutlet weak var entryButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if Auth.auth().currentUser != nil{
            performSegue(withIdentifier: "welcomeToChat", sender: self)
        }
    }
    
    
    @IBAction func entryAction(_ sender: UIButton) {
        performSegue(withIdentifier: "welcomeToChat", sender: self)
    }
    


}

