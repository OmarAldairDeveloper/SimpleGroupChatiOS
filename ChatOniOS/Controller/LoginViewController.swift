//
//  LoginViewController.swift
//  ChatOniOS
//
//  Created by Omar Aldair Romero Pérez on 11/9/18.
//  Copyright © 2018 Omar Aldair Romero Pérez. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var txtFieldEmail: UITextField!
    
    @IBOutlet weak var txtFieldPassword: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func btnLogin(_ sender: UIButton) {
        
        if let email = txtFieldEmail.text, let password = txtFieldPassword.text{
            
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                
                if error != nil{
                    // Hubo error en el inicio de sesión
                    print(error!)
                }else{
                    print("Inicio de sesión CORRECTO")
                    self.performSegue(withIdentifier: "loginToChat", sender: self)
                }
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
