//
//  Tag.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 13/04/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation
import BSON

public enum TagValueType: String, CaseIterable, Codable {
    case text
    case number
    case image
    case switchValue = "switch"
    case checkbox
    case roundSlider = "round-slider"
    case timeRoundSlider = "time-round-slider"
    case slider
    case select
    case radio
    
    public var index: Int {
        let index: Int
        switch self {
        case .text:
            index = 0
        case .number:
            index = 1
        case .image:
            index = 2
        case .switchValue:
            index = 3
        case .checkbox:
            index = 4
        case .roundSlider:
            index = 5
        case .timeRoundSlider:
            index = 6
        case .slider:
            index = 7
        case .select:
            index = 8
        case .radio:
            index = 9
        }
        return index
    }
    
    public init?(index: Int) {
        if index == 0 {
            self = .text
        } else if index == 1 {
            self = .number
        } else if index == 2 {
            self = .image
        } else if index == 3 {
            self = .switchValue
        } else if index == 4 {
            self = .checkbox
        } else if index == 5 {
            self = .roundSlider
        } else if index == 6 {
            self = .timeRoundSlider
        } else if index == 7 {
            self = .slider
        } else if index == 8 {
            self = .select
        } else if index == 9 {
            self = .radio
        } else {
            return nil
        }
    }
}

public enum Alarm: Int, Codable {
    case none
    case warning
    case alarm
    case unknown1
    case unknown2
    
    public var text: String? {
        let text: String?
        switch self {
        case .none:
            text = "none"
        case .warning:
            text = "warning"
        case .alarm:
            text = "alarm"
        default:
            text = nil
        }
        return text
    }
}

final public class Tag: Codable, CustomStringConvertible, SidebarItemable {
    public let id: ObjectId?
    public var name: String
    public var type: String
    public var image: URL?
    public var value: String
    public var valueType: TagValueType
    public var building: ObjectId
    public var group: String?
    public var link: URL?
    public var sortIndex: Int?
    public var alarm: Alarm?
    public var action: ObjectId?
    public var claim: ObjectId
    public var appearance: ObjectId?
    public var behaviour: ObjectId?
    public var menuName: NavigationItem {
        .tags
    }

    typealias TagsResponse = [TagResponse]

    public enum CodingKeys: String, CodingKey {
        case id
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
    }
    
    
    public init(id: ObjectId?, name: String, type: String, image: URL?, value: String, valueType: TagValueType, building: ObjectId, group: String?, link: URL?, sortIndex: Int?, alarm: Alarm?, action: ObjectId?, claim: ObjectId, appearance: ObjectId?, behaviour: ObjectId?) {
        self.id = id
        self.name = name
        self.type = type
        self.image = image
        self.value = value
        self.valueType = valueType
        self.building = building
        self.group = group
        self.link = link
        self.sortIndex = sortIndex
        self.alarm = alarm
        self.action = action
        self.claim = claim
        self.appearance = appearance
        self.behaviour = behaviour
    }
    
    public var description: String {
        let id = self.id?.hexString
        let sortIndex = self.sortIndex ?? -1

        return "id: \(id ?? "") name: \(name) type: \(type) value: \(value) sortIndex: \(sortIndex)"
    }

    public var modelDescription: String {
        var text = "\(self.name))"
        if let sortIndex = self.sortIndex {
            text.append(" sortIndex: \(sortIndex)")
        }
        return text
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try? container.decode(ObjectId.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(String.self, forKey: .type)
        if let imageStr = try? container.decode(String.self, forKey: .image) {
            self.image = URL(string: imageStr)
        } else {
            self.image = nil
        }
        self.value = try container.decode(String.self, forKey: .value)
        self.valueType = try container.decode(TagValueType.self, forKey: .valueType)
        self.building = try container.decode(ObjectId.self, forKey: .building)
        self.group = try? container.decode(String.self, forKey: .group)
        if let linkStr = try? container.decode(String.self, forKey: .link) {
            self.link = URL(string: linkStr)
        } else {
            self.link = nil
        }
        self.sortIndex = try? container.decode(Int.self, forKey: .sortIndex)
        self.alarm = try? container.decode(Alarm.self, forKey: .alarm)
        self.action = try? container.decode(ObjectId.self, forKey: .action)
        self.claim = try container.decode(ObjectId.self, forKey: .claim)
        self.appearance = try? container.decode(ObjectId.self, forKey: .appearance)
        self.behaviour = try? container.decode(ObjectId.self, forKey: .behaviour)
    }

}

extension Tag: Equatable {
    public static func == (lhs: Tag, rhs: Tag) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Tag: Comparable {
    public static func < (lhs: Tag, rhs: Tag) -> Bool {
        guard let leftSortIndex = lhs.sortIndex, let rightSortIndex = rhs.sortIndex else { return false }
        return leftSortIndex < rightSortIndex
    }
    
    
}

extension Tag {
    public convenience init(with tagResponse: TagResponse) {
        self.init(id: tagResponse.id, name: tagResponse.name, type: tagResponse.type, image: tagResponse.image, value: tagResponse.value, valueType: tagResponse.valueType, building: tagResponse.building, group: tagResponse.group, link: tagResponse.link, sortIndex: tagResponse.sortIndex, alarm: tagResponse.alarm, action: tagResponse.action, claim: tagResponse.claim, appearance: tagResponse.appearance, behaviour: tagResponse.behaviour)
    }
}
