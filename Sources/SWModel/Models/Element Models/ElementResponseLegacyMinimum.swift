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
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case type
        case data
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(ObjectId.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        type = try values.decode(ElementType.self, forKey: .type)
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
