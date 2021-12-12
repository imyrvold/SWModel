//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 12/12/2021.
//

import Foundation
import BSON

public struct ElementResponseLegacy: Codable {
    public let id: ObjectId
    public let name: String
    public let type: ElementType
    public var data: ElementData?
    public var claim: Claim
    public let createdOn: String
    public let updatedOn: String
    public let deletedOn: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case type
        case claim
        case data
        case createdOn
        case updatedOn
        case deletedOn
    }
    
    public init(from decoder: Decoder) throws {
        print("ElementResponseLegacy init 1")
        let values = try decoder.container(keyedBy: CodingKeys.self)
        print("ElementResponseLegacy init 2")
        id = try values.decode(ObjectId.self, forKey: .id)
        print("ElementResponseLegacy init 3")
        name = try values.decode(String.self, forKey: .name)
        print("ElementResponseLegacy init 4")
        type = try values.decode(ElementType.self, forKey: .type)
        print("ElementResponseLegacy init 5")
        claim = try values.decode(Claim.self, forKey: .claim)
        print("ElementResponseLegacy init 6")
        createdOn = try values.decode(String.self, forKey: .createdOn)
        print("ElementResponseLegacy init 7")
        updatedOn = try values.decode(String.self, forKey: .updatedOn)
        print("ElementResponseLegacy init 8")
        deletedOn = try? values.decode(String.self, forKey: .deletedOn)
        print("ElementResponseLegacy init 9")
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
        print("ElementResponseLegacy init 10")
    }
}

public extension ElementResponseLegacy {
    static func json(from response: [ElementResponseLegacy]) throws -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        let elementsData = try encoder.encode(response)
        if let json = String(data: elementsData, encoding: .utf8) {
            return json
        }
        return "Couldn't convert response to JSON"
    }

    static func json(from response: ElementResponseLegacy) throws -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        let elementsData = try encoder.encode(response)
        if let json = String(data: elementsData, encoding: .utf8) {
            return json
        }
        return "Couldn't convert response to JSON"
    }

}
