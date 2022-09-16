//
//  CryptosLive.swift
//  EVIOS3
//
//  Created by Cédric Debroux on 14/09/2022.
//

import Foundation
struct Datas: Codable{
    var data : [CryptosLive]
}


struct CryptosLive: Codable{
    
    let id :String
    let rank: String
    let name : String
    let value : String
    let valEvol : String
    
    enum CodingKeys:String, CodingKey{
        case id
        case rank
        case name
        case value = "priceUsd"
        case valEvol = "changePercent24Hr"
    }
}
