//
//  ElementData.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 30/12/2019.
//  Copyright © 2019 Ivan C Myrvold. All rights reserved.
//

import Foundation

public enum ElementType: String, Codable {
    case image
    case tagGroup = "tag-group"
    case tagList = "tag-list"
    case alarmList = "alarm-list"
    case alarmLogList = "alarm-log-list"
    case iframe

    public var index: Int {
        let index: Int
        switch self {
        case .image:
            index = 0
        case .tagGroup:
            index = 1
        case .tagList:
            index = 2
        case .alarmList:
            index = 3
        case .alarmLogList:
            index = 4
        case .iframe:
            index = 5
        }
        return index
    }
    
    public init?(index: Int) {
        if index == 0 {
            self = .image
        } else if index == 1 {
            self = .tagGroup
        } else if index == 2 {
            self = .tagList
        } else if index == 3 {
            self = .alarmList
        } else if index == 4 {
            self = .alarmLogList
        } else if index == 5 {
            self = .iframe
        } else {
            return nil
        }
    }
}


public enum SubelementType: String, Codable {
    case tagList = "tag-list"
}

public enum ElementColumn: String, Codable {
    case image = "img"
    case text
    case empty = ""
    
    public var index: Int? {
        let index: Int?
        switch self {
        case .image:
            index = 0
        case .text:
            index = 1
        default:
            index = nil
        }
        return index
    }
    
    public init?(index: Int) {
        if index == 0 {
            self = .image
        } else if index == 1 {
            self = .text
        } else {
            return nil
        }
    }
}

public enum ElementRow: String, Codable {
    case image
    case alarm
    case name
    case group
    case value
    case empty = ""
    
    public var index: Int? {
        let index: Int?
        switch self {
        case .image:
            index = 0
        case .alarm:
            index = 1
        case .name:
            index = 2
        case .group:
            index = 3
        case .value:
            index = 4
        default:
            index = nil
        }
        return index
    }
    
    public init?(index: Int) {
        if index == 0 {
            self = .image
        } else if index == 1 {
            self = .alarm
        } else if index == 2 {
            self = .name
        } else if index == 3 {
            self = .group
        } else if index == 4 {
            self = .value
        } else {
            return nil
        }
    }

}

public struct Row {
    public var name: String
}

public struct Column {
    public var name: String
}

public struct RowLink: Codable, Equatable {
    public var link: URL?
    public var newTab: Bool
    public var name: String?

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.newTab = (try? container.decode(Bool.self, forKey: .newTab)) ?? false
        self.link = try? container.decode(URL.self, forKey: .link)
        self.name = try? container.decode(String.self, forKey: .name)
    }
    
    public init(link: URL?, newTab: Bool = false, name: String = "") {
        self.link = link
        self.newTab = newTab
        self.name = name
    }
}

public struct SubelementSection: Identifiable {
    public let id: UUID = UUID()
    public let name: String
    public let rows: [String]
}

public struct Subelement: Codable, Identifiable, Equatable {
    public let id = UUID()
    public let name: String
    public let type: SubelementType
    public let isTable: Bool
    public var rowTagIds: [String]?
    public var columns: [ElementColumn]
    public var rows: [[ElementRow]]
    public var rowLinks: [RowLink]?
    
    public enum CodingKeys: String, CodingKey {
        case name
        case type
        case isTable = "table"
        case rowTagIds
        case columns
        case rows
        case rowLinks
    }
}
public extension Subelement {
    var subelementsSections: [SubelementSection] {
        var rows: [SubelementSection] = []
        if let rowTagIds = self.rowTagIds, rowTagIds.count > 0 {
            rows.append(SubelementSection(name: "rowTagIds", rows: rowTagIds))
        }
        if columns.count > 0 {
            rows.append(SubelementSection(name: "columns", rows: columns.map { $0.rawValue }))
        }
        if let first = self.rows.first, first.count > 0 {
            rows.append(SubelementSection(name: "rows", rows: first.map { $0.rawValue }))
        }
        if let rowLinks = self.rowLinks, rowLinks.count > 0 {
            rows.append(SubelementSection(name: "rowLinks", rows: rowLinks.map { "link: \($0.link?.absoluteString ?? "")\nnewTab: \($0.newTab)" }))
        }
        
        return rows
    }
}

public enum ElementData {
    case tagGroup(TagGroupData)
    case tagList(TagListData)
    case image(ImageData)
    case iframe(IframeData)
    case alarmList(AlarmListData)
    case alarmLogList(AlarmLogListData)
    case unsupported

}
extension ElementData: Equatable {
    public static func == (lhs: ElementData, rhs: ElementData) -> Bool {
        let areEqual: Bool
        switch lhs {
        case .tagGroup(let lhsData):
            switch rhs {
            case .tagGroup(let rhsData):
                areEqual = lhsData == rhsData
            default:
                areEqual = false
            }
        case .tagList(let lhsData):
            switch rhs {
            case .tagList(let rhsData):
                areEqual = lhsData == rhsData
            default:
                areEqual = false
            }
        case .image(let lhsData):
            switch rhs {
            case .image(let rhsData):
                areEqual = lhsData == rhsData
            default:
                areEqual = false
            }
        case .iframe(let lhsData):
            switch rhs {
            case .iframe(let rhsData):
                areEqual = lhsData == rhsData
            default:
                areEqual = false
            }
        case .alarmList(let lhsData):
            switch rhs {
            case .alarmList(let rhsData):
                areEqual = lhsData == rhsData
            default:
                areEqual = false
            }
        case .alarmLogList(let lhsData):
            switch rhs {
            case .alarmLogList(let rhsData):
                areEqual = lhsData == rhsData
            default:
                areEqual = false
            }
        case .unsupported:
            areEqual = false
        }
        return areEqual
    }
}
extension ElementData: Encodable {
//    private enum CodingKeys: String, CodingKey {
//        case type
//        case data
//    }
//
//    public init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        let type = try container.decode(ElementType.self, forKey: .type)
//
//        switch type {
//        case .tagGroup:
//            let data = try container.decode(TagGroupData.self, forKey: .type)
//            self = .tagGroup(data)
//        case .tagList:
//            let data = try container.decode(TagListData.self, forKey: .type)
//            self = .tagList(data)
//        case .image:
//            let data = try container.decode(ImageData.self, forKey: .type)
//            self = .image(data)
//        case .iframe:
//            let data = try container.decode(IframeData.self, forKey: .type)
//            self = .iframe(data)
//        case .alarmList:
//            let data = try container.decode(AlarmListData.self, forKey: .type)
//            self = .alarmList(data)
//        case .alarmLogList:
//            let data = try container.decode(AlarmLogListData.self, forKey: .type)
//            self = .alarmLogList(data)
//        }
//    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .tagGroup(let data):
            try container.encode(data)
        case .tagList(let data):
            try container.encode(data)
        case .image(let data):
            try container.encode(data)
        case .iframe(let data):
            try container.encode(data)
        case .alarmList(let data):
            try container.encode(data)
        case .alarmLogList(let data):
            try container.encode(data)
        case .unsupported:
            let context = EncodingError.Context(codingPath: [], debugDescription: "Invalid data")
            throw EncodingError.invalidValue(self, context)
        }
    }
}

public struct TagGroupData: Codable, Equatable {
    public let dataSpan: Int?
    public let dataGridArea: String?
    public var subelements: [Subelement]
    
    public enum CodingKeys: String, CodingKey {
        case dataSpan = "data-span"
        case dataGridArea = "data-grid-area"
        case subelements
    }
}

public struct TagListData: Codable, Equatable {
    public let groupName: String
    
    public enum CodingKeys: String, CodingKey {
        case groupName = "group-name"
    }
}

public struct ImageData: Codable, Equatable {
    public let dataImageUrl: String?
    public let dataSpan: Int?
    public let fitImage: Bool?
    
    public enum CodingKeys: String, CodingKey {
        case dataImageUrl = "data-image-url"
        case dataSpan = "data-span"
        case fitImage = "fit-image"
    }
}

public struct IframeData: Codable, Equatable {
    public let dataUrl: String?
    
    public enum CodingKeys: String, CodingKey {
        case dataUrl = "data-url"
    }
}

public struct AlarmListData: Codable, Equatable {
    public let buildingId: String
    public let refreshRate: Int

    public enum CodingKeys: String, CodingKey {
        case buildingId = "building-id"
        case refreshRate = "refresh-rate"
    }
}

public struct AlarmLogListData: Codable, Equatable {
    public let buildingId: String
    
    public enum CodingKeys: String, CodingKey {
        case buildingId = "building-id"
    }
}
