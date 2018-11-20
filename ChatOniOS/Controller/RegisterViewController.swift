//
//  RegisterViewController.swift
//  ChatOniOS
//
//  Created by Omar Aldair Romero Pérez on 11/9/18.
//  Copyright © 2018 Omar Aldair Romero Pérez. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func btnRegister(_ sender: UIButton) {
        
        if let email = txtFieldEmail.text, let password = txtFieldPassword.text{
            
            // Crear user en Firebase
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                
                if error != nil{
                    // Hubo un error
                    print(error!)
                }else{
                    print("Creación correcta de usuario")
                    self.performSegue(withIdentifier: "registerToChat", sender: self)
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
