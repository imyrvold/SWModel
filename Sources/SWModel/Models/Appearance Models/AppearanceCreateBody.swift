//
//  AppearanceCreateBody.swift
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

public struct AppearanceCreateBody {
    public var name: String
    public var prefix: String?
    public var suffix: String?
    public var size: Int?
    public var holderSize: Int?
    public var textSize: Double?
    #if os(iOS)
    public var selectionColor: UIColor?
    public var backgroundColor: UIColor?
    #else
    public var selectionColor: NSColor?
    public var backgroundColor: NSColor?
    #endif
    public var isExpanded: Bool?
}

extension AppearanceCreateBody: Encodable {
    public enum CodingKeys: String, CodingKey {
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

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

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
