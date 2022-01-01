//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 01/01/2022.
//

import Foundation
import BSON

public struct BehaviourResponseLegacy: Decodable {
    public let id: ObjectId
    public var name: String
    public var min: Int?
    public var max: Int?
    public var numberOfDecimals: Int?
    public var orientation: Orientation?
    public var options: [String]?
    public let createdOn: String
    public let updatedOn: String
    public let deletedOn: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case min
        case max
        case numberOfDecimals
        case orientation
        case options
        case createdOn
        case updatedOn
        case deletedOn
    }

}
