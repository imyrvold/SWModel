//
//  MenuDeleteResponse.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 27/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

struct MenuDeleteResponse {
    let id: String
    let name: String
    let claim: String
    
    public init(id: String, name: String, claim: String) {
        self.id = id
        self.name = name
        self.claim = claim
    }

}
extension MenuDeleteResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case claim
    }
}

