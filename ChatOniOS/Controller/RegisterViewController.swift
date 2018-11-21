//
//  RegisterViewController.swift
//  ChatOniOS
//
//  Created by Omar Aldair Romero Pérez on 11/9/18.
//  Copyright © 2018 Omar Aldair Romero Pérez. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func btnRegister(_ sender: UIButton) {
        
        if let email = txtFieldEmail.text, let password = txtFieldPassword.text{
            
            SVProgressHUD.show()
            
            // Crear user en Firebase
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                
                if error != nil{
                    // Hubo un error
                    self.showAlert(title: "Error", message: "Hubo un error al crear cuenta de usuario")
                    
                    
                }else{
                    
                    SVProgressHUD.dismiss()
                    let alert = UIAlertController(title: "Registro correcto", message: "Te has registrado de manera correcta", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: { (_) in
                        self.performSegue(withIdentifier: "registerToChat", sender: self)
                    })
                    
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                    
                    
                }
            }
        }
        
    }
    
    
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
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
