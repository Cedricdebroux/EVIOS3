//
//  History.swift
//  EVIOS3
//
//  Created by Cédric Debroux on 14/09/2022.
//

import Foundation


struct DatasDetail: Codable{
    var data: [Historic]
}

struct Historic: Codable{
    var priceUsd: String
    var date: String
}
