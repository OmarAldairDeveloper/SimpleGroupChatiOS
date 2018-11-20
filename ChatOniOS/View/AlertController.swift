//
//  AlertController.swift
//  ChatOniOS
//
//  Created by Omar Aldair Romero Pérez on 11/20/18.
//  Copyright © 2018 Omar Aldair Romero Pérez. All rights reserved.
//

import Foundation
import UIKit

class AlertController{
    
    public var alert : UIAlertController = UIAlertController()
    
    func showSimpleAlert(title: String, message: String){
        self.alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
    }
}
