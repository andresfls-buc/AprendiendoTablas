//
//  TweetTableViewCell.swift
//  AprendiendoTablas
//
//  Created by Andres Landazabal on 2025/06/15.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
// MARK: - Referencias UI
    
    @IBOutlet weak var userImageView: UIView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        userImageView.clipsToBounds = true
        
        // frame.widht = ancho
        userImageView.layer.cornerRadius = userImageView.frame.width / 2
    }

    func setUpCell(userName: String, message: String){
        userNameLabel.text = userName
        messageLabel.text = message
    }
    
}
