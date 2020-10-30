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
    
    private init(from decoder: Decoder) throws {
        print("AppearanceCreateBody init from decoder 1")
        let container = try decoder.container(keyedBy: CodingKeys.self)
        print("AppearanceCreateBody init from decoder 2")
        self.name = try container.decode(String.self, forKey: .name)
        print("AppearanceCreateBody init from decoder 3")
        self.prefix = try? container.decode(String.self, forKey: .prefix)
        print("AppearanceCreateBody init from decoder 4")
        self.suffix = try? container.decode(String.self, forKey: .suffix)
        print("AppearanceCreateBody init from decoder 5")
        self.size = try? container.decode(Int.self, forKey: .size)
        print("AppearanceCreateBody init from decoder 6")
        self.holderSize = try? container.decode(Int.self, forKey: .holderSize)
        print("AppearanceCreateBody init from decoder 7")
        self.textSize = try? container.decode(Double.self, forKey: .textSize)
        print("AppearanceCreateBody init from decoder 8")
        self.selectionColor = try? container.decode(AppearanceColor.self, forKey: .selectionColor)
        print("AppearanceCreateBody init from decoder 9")
        self.backgroundColor = try? container.decode(AppearanceColor.self, forKey: .backgroundColor)
        print("AppearanceCreateBody init from decoder 10")
        self.isExpanded = try? container.decode(Bool.self, forKey: .isExpanded)
        print("AppearanceCreateBody init from decoder 11")
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

