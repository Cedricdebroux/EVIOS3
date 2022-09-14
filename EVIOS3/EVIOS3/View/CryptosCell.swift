//
//  CryptosCell.swift
//  EVIOS3
//
//  Created by Cédric Debroux on 14/09/2022.
//

import UIKit

class CryptosCell: UITableViewCell {
    
    @IBOutlet var LogoImage: UIImageView!
    static let identifier = "CryptosCell"
    
    @IBOutlet var nameCryptoLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}