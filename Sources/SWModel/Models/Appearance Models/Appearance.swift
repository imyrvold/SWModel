//
//  Appearance.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 13/04/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation
import BSON

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
    public var selectionColor: String?
    public var backgroundColor: String?
    public var isExpanded: Bool?
    public var updatedAt: Date
    public var createdAt: Date
    public var deletedAt: Date?
    public var menuName: NavigationItem {
        .appearances
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

public extension Appearance {
    static var empty: Appearance {
        let date = Date()
        return Appearance(id: nil, name: "", prefix: nil, suffix: nil, size: nil, holderSize: nil, textSize: nil, selectionColor: nil, backgroundColor: nil, isExpanded: nil, updatedAt: date, createdAt: date, deletedAt: nil)
    }
    
    var isEmpty: Bool {
        name.isEmpty
    }
}

