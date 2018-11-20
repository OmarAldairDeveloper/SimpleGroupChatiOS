//
//  ChatViewController.swift
//  ChatOniOS
//
//  Created by Omar Aldair Romero Pérez on 11/9/18.
//  Copyright © 2018 Omar Aldair Romero Pérez. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtFieldSend: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Registrar la celda ya que la configuramos con un XIB y no gráficamente desde el storyboard
        self.tableView.register(UINib(nibName: "Cell", bundle: nil), forCellReuseIdentifier: "MessageCellID")
    }
    
    
    @IBAction func btnLogOut(_ sender: UIBarButtonItem) {
        
        do{
            // Cerrar sesión en Firebase
            try Auth.auth().signOut()
            
        }catch{
            print(error.localizedDescription)
        }
        
        // Regresar al ViewController padre
        guard navigationController?.popToRootViewController(animated: true) != nil else{
            return
        }
    }
    

    @IBAction func btnSend(_ sender: UIButton) {
        
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    // MARK: UITableViewDataSource
    var messagesArray : [Message] = [Message(), Message(), Message(), Message()]
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCellID", for: indexPath) as! Cell
        
        cell.userMessage.text = messagesArray[indexPath.row].sender
        cell.textMessage.text = messagesArray[indexPath.row].message
        
        return cell
    }
    
    
    
    // MARK: UITableViewDelegate

}
