//
//  AppearanceCreateBody.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 13/04/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct AppearanceCreateBody {
    public var name: String
    public var prefix: String?
    public var suffix: String?
    public var size: Int?
    public var holderSize: Int?
    public var textSize: Double?
    public var selectionColor: String?
    public var backgroundColor: String?
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
            try container.encode(selectionColor, forKey: .selectionColor)
        }
        if let backgroundColor = self.backgroundColor {
            try container.encode(backgroundColor, forKey: .backgroundColor)
        }
        if let isExpanded = self.isExpanded {
            try container.encode(isExpanded, forKey: .isExpanded)
        }
    }

}
