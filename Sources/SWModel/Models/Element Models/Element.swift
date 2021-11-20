//
//  Element.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 30/12/2019.
//  Copyright © 2019 Ivan C Myrvold. All rights reserved.
//

import Foundation
import BSON

public struct Element: Hashable, Identifiable, SidebarItemable {
    
   public  let id: ObjectId?
    public var name: String
    public var type: ElementType
    public var data: ElementData?
    public var claim: Claim?
    public var menuName: NavigationItem {
        .elements
    }

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

extension Element: Decodable {
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case type
        case claim
        case data
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try? values.decode(ObjectId.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        type = try values.decode(ElementType.self, forKey: .type)
        claim = try? values.decode(Claim.self, forKey: .claim)
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

extension Element: Encodable {}

