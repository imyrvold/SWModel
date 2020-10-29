//
//  AppearanceCreateBody.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 13/04/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct AppearanceCreateBody: Codable {
    public var name: String
    public var prefix: String?
    public var suffix: String?
    public var size: Int?
    public var holderSize: Int?
    public var textSize: Double?
    public var selectionColor: AppearanceColor?
    public var backgroundColor: AppearanceColor?
    public var isExpanded: Bool?
    
    public init(name: String, prefix: String? = nil, suffix: String? = nil, size: Int? = nil, holderSize: Int? = nil, textSize: Double? = nil, selectionColor: AppearanceColor? = nil, backgroundColor: AppearanceColor? = nil, isExpanded: Bool? = nil) {
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

