//
//  Element.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 30/12/2019.
//  Copyright © 2019 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct Element: Hashable, Identifiable {
    
   public  let id: String?
    public var name: String
    public var type: ElementType
    public var data: ElementData?
    public var claim: Claim?
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Element: Equatable {
    public static func == (lhs: Element, rhs: Element) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Element: Comparable {
    public static func < (lhs: Element, rhs: Element) -> Bool {
        return lhs.name < rhs.name
    }
}

extension Element {
    public func isEqual(to element: Element) -> Bool {
        return self.name == element.name && self.type == element.type && self.data == element.data && self.claim == element.claim
    }
}
extension Element: Codable {
    public enum CodingKeys: String, CodingKey {
        case id
        case name
        case type
        case data
        case claim
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.claim = try? container.decode(Claim.self, forKey: .claim)
        
        let type = try container.decode(ElementType.self, forKey: .type)
        self.type = type
        
        switch type {
        case .tagGroup:
            let data = try container.decode(TagGroupData.self, forKey: .data)
            self.data = .tagGroup(data)
        case .tagList:
            let data = try container.decode(TagListData.self, forKey: .data)
            self.data = .tagList(data)
        case .image:
            let data = try container.decode(ImageData.self, forKey: .data)
            self.data = .image(data)
        case .iframe:
            let data = try container.decode(IframeData.self, forKey: .data)
            self.data = .iframe(data)
        case .alarmList:
            let data = try container.decode(AlarmListData.self, forKey: .data)
            self.data = .alarmList(data)
        case .alarmLogList:
            let data = try container.decode(AlarmLogListData.self, forKey: .data)
            self.data = .alarmLogList(data)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.claim, forKey: .claim)
        
        switch self.type {
        case .tagGroup:
            try container.encode(ElementType.tagGroup.rawValue, forKey: .type)
            try container.encode(self.data, forKey: .data)
        case .tagList:
            try container.encode(ElementType.tagList.rawValue, forKey: .type)
            try container.encode(self.data, forKey: .data)
        case .image:
            try container.encode(ElementType.image.rawValue, forKey: .type)
            try container.encode(self.data, forKey: .data)
        case .iframe:
            try container.encode(ElementType.iframe.rawValue, forKey: .type)
            try container.encode(self.data, forKey: .data)
        case .alarmList:
            try container.encode(ElementType.alarmList.rawValue, forKey: .type)
            try container.encode(self.data, forKey: .data)
        case .alarmLogList:
            try container.encode(ElementType.alarmLogList.rawValue, forKey: .type)
            try container.encode(self.data, forKey: .data)
        }
    }
}

