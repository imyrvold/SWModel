//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 01/01/2022.
//

import Foundation
import BSON

public struct TagResponseLegacy: Decodable {
    public struct TagResponseMinimum: Decodable {
        public let id: ObjectId
        public let name: String
        
        public enum CodingKeys: String, CodingKey {
            case id = "_id"
            case name
        }

    }
    public struct ClaimResponseMinimum: Decodable {
        public let id: ObjectId
        public let name: String

        public enum CodingKeys: String, CodingKey {
            case id = "_id"
            case name
        }
    }
    public let id: ObjectId
    public let name: String
    public let type: String
    public let image: URL?
    public let value: String
    public let valueType: TagValueType
    public let building: BuildingResponseLegacy
    public let group: String?
    public let link: String?
    public let sortIndex: Int?
    public let alarm: Alarm?
    public let action: TagResponseMinimum?
    public let claim: ClaimResponseMinimum
    public let appearance: AppearanceResponseLegacy?
    public let behaviour: BehaviourResponseLegacy?
    public let radio: [String]?
    public let alarmShow: Bool
    public let tagid: Int?
    
    public enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case type
        case image
        case value
        case valueType
        case building
        case group
        case link
        case sortIndex
        case alarm
        case action
        case claim
        case appearance
        case behaviour
        case radio
        case alarmShow
        case tagid
    }

}
