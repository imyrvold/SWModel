//
//  Appearance.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 13/04/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#else
import AppKit
#endif

public struct Appearance: Codable, Equatable {
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
    #if os(iOS)
    public var selectionColor: UIColor?
    #else
    public var selectionColor: NSColor?
    #endif
    #if os(iOS)
    public var backgroundColor: UIColor?
    #else
    public var backgroundColor: NSColor?
    #endif
    public var isExpanded: Bool?
    
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
        let selection = try container.decodeIfPresent(String.self, forKey: .selectionColor)
        let background = try container.decodeIfPresent(String.self, forKey: .backgroundColor)
        if let selectionColor = selection {
            #if os(iOS)
            self.selectionColor = UIColor(hexString: selectionColor)
            #else
            self.selectionColor = NSColor(hexString: selectionColor)
            #endif
        }
        if let backgroundColor = background {
            #if os(iOS)
            self.backgroundColor = UIColor(hexString: backgroundColor)
            #else
            self.backgroundColor = NSColor(hexString: backgroundColor)
            #endif
        }
        self.isExpanded = try container.decode(Bool.self, forKey: .isExpanded)
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
            let hexColor = selectionColor.toHexString()
            try container.encode(hexColor, forKey: .selectionColor)
        }
        if let backgroundColor = self.backgroundColor {
            let hexColor = backgroundColor.toHexString()
            try container.encode(hexColor, forKey: .backgroundColor)
        }
        if let isExpanded = self.isExpanded {
            try container.encode(isExpanded, forKey: .isExpanded)
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
            description.append(" selectionColor: \(selectionColor.toHexString())")
        }
        if let backgroundColor = self.backgroundColor {
            description.append(" backgroundColor: \(backgroundColor.toHexString())")
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
