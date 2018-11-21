//
//  Cell.swift
//  ChatOniOS
//
//  Created by Omar Aldair Romero Pérez on 11/20/18.
//  Copyright © 2018 Omar Aldair Romero Pérez. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var imageMessage: UIImageView!
    @IBOutlet weak var userMessage: UILabel!
    @IBOutlet weak var textMessage: UILabel!
    @IBOutlet weak var messageBackground: UIView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
