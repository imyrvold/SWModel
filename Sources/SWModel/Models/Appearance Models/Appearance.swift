//
//  Appearance.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 13/04/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation
import BSON

public struct AppearanceColor: Codable, Equatable {
    public var lightColor: String
    public var darkColor: String
    public var isEmpty: Bool {
        lightColor == "#ffffff" && darkColor == "#000000"
    }
    
    public init(lightColor: String, darkColor: String) {
        self.lightColor = lightColor
        self.darkColor = darkColor
    }
}

public extension AppearanceColor {
    static var empty: AppearanceColor {
        AppearanceColor(lightColor: "#ffffff", darkColor: "#000000")
    }
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
        if let createdAt = self.createdAt {
            description.append(" createdAt: \(createdAt)")
        }
        if let updatedAt = self.updatedAt {
            description.append(" updatedAt: \(updatedAt)")
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

// Used when want to return nil when value is empty
public extension Appearance {
    var modifiedPrefix: String? {
        if let prefix = self.prefix {
            return prefix.isEmpty ? nil : prefix
        } else {
            return nil
        }
    }
    
    var modifiedSuffix: String? {
        if let suffix = self.suffix {
            return suffix.isEmpty ? nil : suffix
        } else {
            return nil
        }
    }
    
    var modifiedSize: Int? {
        if let size = self.size {
            return size <= 0 ? nil : size
        } else {
            return nil
        }
    }
    
    var modifiedHolderSize: Int? {
        if let holderSize = self.holderSize {
            return holderSize <= 0 ? nil : holderSize
        } else {
            return nil
        }
    }
    
    var modifiedTextSize: Double? {
        if let textSize = self.textSize {
            return textSize <= 0 ? nil : textSize
        } else {
            return nil
        }
    }
    
    var modifiedSelectionColor: AppearanceColor? {
        if let selectionColor = self.selectionColor {
            return selectionColor.isEmpty ? nil : selectionColor
        } else {
            return nil
        }
    }
    
    var modifiedBackgroundColor: AppearanceColor? {
        if let backgroundColor = self.backgroundColor {
            return backgroundColor.isEmpty ? nil : backgroundColor
        } else {
            return nil
        }
    }
}

// Used when prepare for editing in TextField
public extension Appearance {
    var editPrefix: String {
        self.prefix ?? ""
    }
    
    var editSuffix: String {
        self.suffix ?? ""
    }
    
    var editSize: Int {
        self.size ?? 0
    }
    
    var editHolderSize: Int {
        self.holderSize ?? 0
    }
    
    var editTextSize: Double {
        self.textSize ?? 0
    }
    
    var editSelectionColor: AppearanceColor {
        self.selectionColor ?? AppearanceColor.empty
    }
    
    var editBackgroundColor: AppearanceColor {
        self.backgroundColor ?? AppearanceColor.empty
    }
}
