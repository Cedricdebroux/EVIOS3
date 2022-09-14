//
//  cryptoLiveCell.swift
//  EVIOS3
//
//  Created by Cédric Debroux on 14/09/2022.
//

import UIKit

class CryptoLiveCell: UITableViewCell {
    
    static let identifier = "CryptoLiveCell"
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var rankLabel: UILabel!
    
    @IBOutlet var valueLabel: UILabel!
    
    @IBOutlet var evalLabel: UILabel!
    
    @IBOutlet var infoButton: UIButton!
    
    func setupCell(cryptoLive: CryptosLive){
        nameLabel.text = cryptoLive.name
        rankLabel.text = cryptoLive.rank
        valueLabel.text = cryptoLive.value
        evalLabel.text = cryptoLive.valEvol
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
