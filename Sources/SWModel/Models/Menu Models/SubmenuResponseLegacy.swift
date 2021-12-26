//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 26/12/2021.
//

import Foundation
import BSON

public struct SubmenuResponseLegacy: Decodable {
    public let id: ObjectId
    public let name: String
    let link: String
    let claim: ClaimResponseLegacy
    let newTab: Bool?
    
    public enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case link
        case claim
        case newTab
    }

}
