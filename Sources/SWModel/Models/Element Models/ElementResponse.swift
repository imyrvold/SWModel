//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 16/08/2020.
//

import Foundation
import BSON

public struct ElementResponse {
    public  let id: ObjectId
    public var name: String
    public var type: ElementType
    public var data: ElementData?
    public var claim: String?
}

extension ElementResponse: Decodable {
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
        claim = try? values.decode(String.self, forKey: .claim)
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
        }
    }
}

extension ElementResponse: Encodable {}
