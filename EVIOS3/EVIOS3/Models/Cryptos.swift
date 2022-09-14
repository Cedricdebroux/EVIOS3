//
//  Cryptos.swift
//  EVIOS3
//
//  Created by Cédric Debroux on 14/09/2022.
//

import Foundation


struct Coins : Codable{
    var coins: [Cryptos]
}

struct Cryptos: Codable{
    let name : String
    let icon : String?
}
