//
//  Appearance.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 13/04/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation
import BSON

public struct AppearanceColor: Codable {
    let lightColor: String
    let darkColor: String
}

public struct Appearance: Codable, Identifiable, Equatable, SidebarItemable {
    public static func == (lhs: Appearance, rhs: Appearance) -> Bool {
        return lhs.id == rhs.id
    }
    
    public let id: ObjectId?
    public var name: String
    public var prefix: String?
    public var suffix: String?
    public var size: Int?
    public var holderSize: Int?
    public var textSize: Double?
    public var selectionColor: AppearanceColor?
    public var backgroundColor: AppearanceColor?
    public var isExpanded: Bool?
    public var updatedAt: Date?
    public var createdAt: Date?
    public var deletedAt: Date?
    public var menuName: NavigationItem {
        .appearances
    }
    
    public init(id: ObjectId?, name: String, prefix: String?, suffix: String?, size: Int?, holderSize: Int?, textSize: Double?, selectionColor: AppearanceColor?, backgroundColor: AppearanceColor?, isExpanded: Bool?, createdAt: Date?, updatedAt: Date?, deletedAt: Date?) {
        self.id = id
        self.name = name
        self.prefix = prefix
        self.suffix = suffix
        self.size = size
        self.holderSize = holderSize
        self.textSize = textSize
        self.selectionColor = selectionColor
        self.backgroundColor = backgroundColor
        self.isExpanded = isExpanded
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.deletedAt = deletedAt
    }
}

extension Appearance: CustomStringConvertible {
    public var description: String {
        let id = self.id
        var description = "id: \(id?.hexString ?? "") name: \(self.name)"
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

public extension Appearance {
    static var empty: Appearance {
        let date = Date()
        return Appearance(id: nil, name: "", prefix: nil, suffix: nil, size: nil, holderSize: nil, textSize: nil, selectionColor: nil, backgroundColor: nil, isExpanded: nil, createdAt: date, updatedAt: date, deletedAt: nil)
    }
    
    var isEmpty: Bool {
        name.isEmpty
    }
}

extension Appearance {
    public init(with appearanceResponse: AppearanceResponse) {
        self.init(id: appearanceResponse.id, name: appearanceResponse.name, prefix: appearanceResponse.prefix, suffix: appearanceResponse.suffix, size: appearanceResponse.size, holderSize: appearanceResponse.holderSize, textSize: appearanceResponse.textSize, selectionColor: appearanceResponse.selectionColor, backgroundColor: appearanceResponse.backgroundColor, isExpanded: appearanceResponse.isExpanded, createdAt: appearanceResponse.createdAt, updatedAt: appearanceResponse.updatedAt, deletedAt: appearanceResponse.deletedAt)
    }
}
