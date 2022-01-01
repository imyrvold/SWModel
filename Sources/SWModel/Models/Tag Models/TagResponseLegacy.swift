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
    }
    public struct ClaimResponseMinimum: Decodable {
        public let id: ObjectId
        public let name: String
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
}
