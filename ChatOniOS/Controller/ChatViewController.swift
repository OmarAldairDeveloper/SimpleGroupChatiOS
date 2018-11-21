//
//  ChatViewController.swift
//  ChatOniOS
//
//  Created by Omar Aldair Romero Pérez on 11/9/18.
//  Copyright © 2018 Omar Aldair Romero Pérez. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
   
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtFieldSend: UITextField!
    @IBOutlet weak var btnSendOutlet: UIButton!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        self.tableView.addGestureRecognizer(tapGesture)
        
        // Registrar la celda ya que la configuramos con un XIB y no gráficamente desde el storyboard
        self.tableView.register(UINib(nibName: "Cell", bundle: nil), forCellReuseIdentifier: "MessageCellID")
        
        self.tableView.separatorStyle = .none
        self.configureTableView()
        self.getMessageForFirebase()
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
        
        // Cerrar el teclado
        self.txtFieldSend.endEditing(true)
        
        // Bloquear los elementos para no enviar mensajes duplicados
        self.txtFieldSend.isEnabled = false
        self.btnSendOutlet.isEnabled = false
        
        
        // Referencia a la base de datos de Firebase
        let dbReference = Database.database().reference().child("Messages")
        
        
        // Diccionario para mandar datos a Firebase
        let dict = ["sender" : Auth.auth().currentUser?.email, "message" : txtFieldSend.text]
        
        
        // Mandar a la base de datos
        dbReference.childByAutoId().setValue(dict) { (error, reference) in
            
            if error != nil{
                // Hubo error
                print(error!)
            }else{
                print("Mensaje guardado correctamente")
                
                self.txtFieldSend.isEnabled = true
                self.btnSendOutlet.isEnabled = true
                self.txtFieldSend.text = ""
            }
        }
        
        
        
    }
    
    
    func getMessageForFirebase(){
        
        let dbReference = Database.database().reference().child("Messages")
        
        dbReference.observe(.childAdded) { (snapshot) in
            
            let snapValue = snapshot.value as! Dictionary<String, String>
            
            let sender = snapValue["sender"]!
            let message = snapValue["message"]!
            
            let messageObject = Message(sender: sender, message: message)
            self.messagesArray.append(messageObject)
            
            self.configureTableView()
            self.tableView.reloadData()
            
        }
    }
    
    func configureTableView(){
        // F8unción para intentar que las celdas tengan un ancho de 120 y que sino se puede crear ese espacio, entonces ajustarla
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 120
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
    var messagesArray : [Message] = [Message]()
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
    
    
    // MARK: UITextFieldDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Cuando se abre el teclado del dispositivo
        UIView.animate(withDuration: 0.5) {
            self.heightConstraint.constant = 80 + 258 // Agrandamos la restricción ya que el teclado ocupa ese espacio
            self.view.layoutIfNeeded() // Repintar en tiempo de ejecución para reflejar la constraint
        }
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Cuando se cierra el teclado del dispositivo
        tableViewTapped()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Cuando se aprieta intro en el teclado del dispositivo
        textField.endEditing(true)
        return true
    }
    
    
    @objc func tableViewTapped(){
        self.txtFieldSend.resignFirstResponder()
        UIView.animate(withDuration: 0.5) {
            self.heightConstraint.constant = 80 // Devolver tamaño original a la constraint
            self.view.layoutIfNeeded() // Repintar
        }
    }

}
