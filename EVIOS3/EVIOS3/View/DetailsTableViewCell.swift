//
//  DetailsTableViewCell.swift
//  EVIOS3
//
//  Created by Cédric Debroux on 14/09/2022.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    
    static let identifier = "DetailsTableViewCell"
    
    
    @IBOutlet var valueLabel: UILabel!
    
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupHistory(history : Historic){
        valueLabel.text = history.priceUsd
        dateLabel.text = history.date
    }
    
}
