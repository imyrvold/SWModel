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

//public extension AppearanceResponseLegacy {
//    struct Appearance: Encodable {
//        public let id: ObjectId
//        public let name: String
//        public var prefix: String?
//        public var suffix: String?
//        public var size: Int?
//        public var holderSize: Int?
//        public var textSize: Double?
//        public var selectionColor: AppearanceColor?
//        public var backgroundColor: AppearanceColor?
//        public var isExpanded: Bool?
//        public let createdOn: String
//        public let updatedOn: String
//        public let deletedOn: String?
//    }
//
//    static func appearanceResponse(from response: AppearanceResponseLegacy) -> Appearance {
//        return Appearance(id: response.id, name: response.name, prefix: response.prefix, suffix: response.suffix, size: response.size, holderSize: response.holderSize, textSize: response.textSize, selectionColor: response.selectionColor, backgroundColor: response.backgroundColor, isExpanded: response.isExpanded, createdOn: response.createdOn, updatedOn: response.updatedOn, deletedOn: response.deletedOn)
//    }
//
//    static func appearancesResponse(from response: [AppearanceResponseLegacy]) -> [Appearance] {
//        response.map { appearanceResponseLegacy in
//            return Self.appearanceResponse(from: appearanceResponseLegacy)
//        }
//    }
//}
