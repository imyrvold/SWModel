//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 29/12/2021.
//

import Foundation
import BSON

public struct LinkResponseLegacy: Decodable {
    public let id: ObjectId
    public let group: String
    public let label: String
    public let link: String
    public let newTab: Bool?
    
    public enum CodingKeys: String, CodingKey {
        case id = "_id"
        case group
        case label
        case link
        case newTab
    }

}
