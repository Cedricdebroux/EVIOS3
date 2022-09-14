//
//  CryptosCell.swift
//  EVIOS3
//
//  Created by Cédric Debroux on 14/09/2022.
//

import UIKit
import AlamofireImage

class CryptosCell: UITableViewCell {
    
    @IBOutlet var LogoImage: UIImageView!
    static let identifier = "CryptosCell"
    
    @IBOutlet var nameCryptoLabel: UILabel!
    
    func setupCell(cryptosC : Cryptos){
        nameCryptoLabel.text = cryptosC.name
        if let imageUrl = cryptosC.icon,
           let url = URL(string: imageUrl){
            LogoImage.af.setImage(withURL: url)
        }else {
            LogoImage.isHidden = true
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        LogoImage.af.cancelImageRequest()
        LogoImage.image = nil
        LogoImage.isHidden = false
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
