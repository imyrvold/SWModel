//
//  Appearance.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 13/04/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct Appearance: Codable, Equatable, SidebarItemable {
    public static func == (lhs: Appearance, rhs: Appearance) -> Bool {
        return lhs.id == rhs.id
    }
    
    public let id: String
    public var name: String
    public var prefix: String?
    public var suffix: String?
    public var size: Int?
    public var holderSize: Int?
    public var textSize: Double?
    public var selectionColor: String?
    public var backgroundColor: String?
    public var isExpanded: Bool?
    public var updatedAt: Date
    public var createdAt: Date
    public var deletedAt: Date?
    public var menuName: NavigationItem {
        .appearances
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case name
        case prefix
        case suffix
        case size
        case holderSize
        case textSize
        case selectionColor
        case backgroundColor
        case isExpanded
        case createdAt
        case updatedAt
        case deletedAt
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.prefix = try container.decodeIfPresent(String.self, forKey: .prefix)
        self.suffix = try container.decodeIfPresent(String.self, forKey: .suffix)
        self.size = try container.decodeIfPresent(Int.self, forKey: .size)
        self.holderSize = try container.decodeIfPresent(Int.self, forKey: .holderSize)
        self.textSize = try container.decodeIfPresent(Double.self, forKey: .textSize)
        self.selectionColor = try container.decodeIfPresent(String.self, forKey: .selectionColor)
        self.backgroundColor = try container.decodeIfPresent(String.self, forKey: .backgroundColor)
        self.isExpanded = try container.decode(Bool.self, forKey: .isExpanded)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.deletedAt = try container.decode(Date.self, forKey: .deletedAt)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        if let prefix = self.prefix {
            try container.encode(prefix, forKey: .prefix)
        }
        if let suffix = self.suffix {
            try container.encode(suffix, forKey: .suffix)
        }
        if let size = self.size {
            try container.encode(size, forKey: .size)
        }
        if let holderSize = self.holderSize {
            try container.encode(holderSize, forKey: .holderSize)
        }
        if let textSize = self.textSize {
            try container.encode(textSize, forKey: .textSize)
        }
        if let selectionColor = self.selectionColor {
            try container.encode(selectionColor, forKey: .selectionColor)
        }
        if let backgroundColor = self.backgroundColor {
            try container.encode(backgroundColor, forKey: .backgroundColor)
        }
        if let isExpanded = self.isExpanded {
            try container.encode(isExpanded, forKey: .isExpanded)
        }
        
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        
        if let deletedAt = self.deletedAt {
            try container.encode(deletedAt, forKey: .deletedAt)
        }
        
    }
    
}

extension Appearance: CustomStringConvertible {
    public var description: String {
        let id = self.id
        var description = "id: \(id) name: \(self.name)"
        if let prefix = self.prefix {
            description.append(" prefix: \(prefix)")
        }
        if let suffix = self.suffix {
            description.append(" suffix: \(suffix)")
        }
        if let size = self.size {
            description.append(" size: \(size)")
        }
        if let holderSize = self.holderSize {
            description.append(" holderSize: \(holderSize)")
        }
        if let textSize = self.textSize {
            description.append(" textSize: \(textSize)")
        }
        if let selectionColor = self.selectionColor {
            description.append(" selectionColor: \(selectionColor)")
        }
        if let backgroundColor = self.backgroundColor {
            description.append(" backgroundColor: \(backgroundColor)")
        }
        if let isExpanded = self.isExpanded {
            description.append(" isExpanded: \(isExpanded)")
        }
        
        return description
    }
}

extension Appearance: Comparable {
    public static func < (lhs: Appearance, rhs: Appearance) -> Bool {
        return lhs.name < rhs.name
    }
}
