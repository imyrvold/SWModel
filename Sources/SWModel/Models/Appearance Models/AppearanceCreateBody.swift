//
//  AppearanceCreateBody.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 13/04/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation
import BSON

public struct AppearanceCreateBody: Codable {
    public var id: ObjectId?
    public var name: String
    public var prefix: String?
    public var suffix: String?
    public var size: Int?
    public var holderSize: Int?
    public var textSize: Double?
    public var selectionColor: AppearanceColor?
    public var backgroundColor: AppearanceColor?
    public var isExpanded: Bool?
    
    public init(id: ObjectId?, name: String, prefix: String? = nil, suffix: String? = nil, size: Int? = nil, holderSize: Int? = nil, textSize: Double? = nil, selectionColor: AppearanceColor? = nil, backgroundColor: AppearanceColor? = nil, isExpanded: Bool? = nil) {
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
    }
    
    public mutating func clear() {
        self.name = ""
        self.prefix = nil
        self.suffix = nil
        self.size = nil
        self.holderSize = nil
        self.textSize = nil
        self.selectionColor = nil
        self.backgroundColor = nil
        self.isExpanded = nil
    }
}

public extension AppearanceCreateBody {
    func httpBody() throws -> Data {
        try JSONEncoder().encode(self)
    }
}

public extension AppearanceCreateBody {
    static func createBody(from appearanceLegacy: AppearanceResponseLegacy) -> AppearanceCreateBody {
        let selectionColor, backgroundColor: AppearanceColor?
        if let selection = appearanceLegacy.selectionColor {
            selectionColor = AppearanceColor(lightColor: selection, darkColor: selection)
        } else {
            selectionColor = nil
        }
        if let background = appearanceLegacy.backgroundColor {
            backgroundColor = AppearanceColor(lightColor: background, darkColor: background)
        } else {
            backgroundColor = nil
        }
        return AppearanceCreateBody(id: appearanceLegacy.id, name: appearanceLegacy.name, prefix: appearanceLegacy.prefix, suffix: appearanceLegacy.suffix, size: appearanceLegacy.size, holderSize: appearanceLegacy.holderSize, textSize: appearanceLegacy.textSize, selectionColor: selectionColor, backgroundColor: backgroundColor, isExpanded: appearanceLegacy.isExpanded)
    }
}
