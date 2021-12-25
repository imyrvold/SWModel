//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 25/12/2021.
//

import Foundation
import BSON

public struct ElementResponseLegacyMinimum: Codable {
    public let id: ObjectId
    public let name: String
    public let type: ElementType
    public var data: ElementData?
    public var claim: ClaimResponseLegacy
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case type
        case claim
        case data
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(ObjectId.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        type = try values.decode(ElementType.self, forKey: .type)
        claim = try values.decode(ClaimResponseLegacy.self, forKey: .claim)
        switch type {
        case .tagGroup:
            data = try .tagGroup(values.decode(TagGroupData.self, forKey: .data))
        case .tagList:
            data = try .tagList(values.decode(TagListData.self, forKey: .data))
        case .alarmList:
            data = try .alarmList(values.decode(AlarmListData.self, forKey: .data))
        case .alarmLogList:
            data = try .alarmLogList(values.decode(AlarmLogListData.self, forKey: .data))
        case .iframe:
            data = try .iframe(values.decode(IframeData.self, forKey: .data))
        case .image:
            data = try .image(values.decode(ImageData.self, forKey: .data))
        case .avPagesCalendar:
            data = try .avPagesCalendar(values.decode(AvPagesCalendarData.self, forKey: .data))
        case .avMonthlyCalendar, .advRoundSlider:
            data = nil
        }
    }
}

public extension ElementResponseLegacyMinimum {
    struct Element: Encodable {
        public let id: String
        public let name: String
        public let type: ElementType
        public let data: ElementData?
        public let claim: String
    }
    
    static func elementResponse(from response: ElementResponseLegacyMinimum) -> Element {
        return Element(id: response.id.hexString, name: response.name, type: response.type, data: response.data, claim: response.claim.id.hexString)
    }

    static func elementsResponse(from response: [ElementResponseLegacyMinimum]) -> [Element] {
        response.map { elementResponseLegacy in
            return Element(id: elementResponseLegacy.id.hexString, name: elementResponseLegacy.name, type: elementResponseLegacy.type, data: elementResponseLegacy.data, claim: elementResponseLegacy.claim.id.hexString)
        }
    }
}
