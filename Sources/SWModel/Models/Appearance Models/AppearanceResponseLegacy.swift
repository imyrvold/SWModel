//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 31/12/2021.
//

import Foundation
import BSON

public struct AppearanceResponseLegacy: Decodable {
    public let id: ObjectId
    public let name: String
    public var prefix: String?
    public var suffix: String?
    public var size: Int?
    public var holderSize: Int?
    public var textSize: Double?
    public var selectionColor: String?
    public var backgroundColor: String?
    public var isExpanded: Bool?
    public let createdOn: String
    public let updatedOn: String
    public let deletedOn: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case prefix
        case suffix
        case size
        case holderSize
        case textSize
        case selectionColor
        case backgroundColor
        case isExpanded
        case createdOn
        case updatedOn
        case deletedOn
    }
}
