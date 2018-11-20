//
//  Message.swift
//  ChatOniOS
//
//  Created by Omar Aldair Romero Pérez on 11/20/18.
//  Copyright © 2018 Omar Aldair Romero Pérez. All rights reserved.
//

import Foundation


class Message{
    
    var sender : String
    var message : String
    
    init(sender: String, message: String) {
        self.sender = sender
        self.message = message
    }
    
    
    init() {
        self.sender = "Omar Aldair"
        self.message = "Este es un mensaje de prueba"
    }
    
    
}
