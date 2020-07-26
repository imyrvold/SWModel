//
//  MenuDeleteResponse.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 27/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct MenuDeleteResponse {
    public let id: String
    public let name: String
    public let claim: String
    
    public init(id: String, name: String, claim: String) {
        self.id = id
        self.name = name
        self.claim = claim
    }

}
extension MenuDeleteResponse: Decodable {
    public enum CodingKeys: String, CodingKey {
        case id
        case name
        case claim
    }
}

