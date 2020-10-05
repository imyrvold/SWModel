//
//  Icon.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 15/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation
import BSON

public struct Icon: Identifiable, CustomStringConvertible, SidebarItemable {
    public let id: ObjectId?
    public var name: String
    public var icons: [SubIcon] = []
    public var menuName: NavigationItem {
        .icons
    }

    public var description: String {
        return "id: \(self.id) name: \"\(self.name)\" \nicons: \(self.icons)"
    }
}

public struct SubIcon: Identifiable, CustomStringConvertible {
    public let id = UUID()
    public var min: Int?
    public var max: Int?
    public let value: Int?
    public var image: String
    
    public var description: String {
        var description = ""
        if let min = self.min {
            description.append("min: \(min) ")
        }
        if let max = self.max {
            description.append("max: \(max) ")
        }
        if let value = self.value {
            description.append("value: \(value) ")
        }
        description.append("image: \"\(image)\"")
        
        return description
    }
}

extension Icon: Codable {
    public enum CodingKeys: String, CodingKey {
        case id
        case name
        case icons
    }
}

extension Icon: Equatable {
    public static func == (lhs: Icon, rhs: Icon) -> Bool {
        return lhs.id == rhs.id
    }
    
}

extension Icon: Comparable {
    public static func < (lhs: Icon, rhs: Icon) -> Bool {
        return lhs.name < rhs.name
    }
}

extension SubIcon: Codable {
    public enum CodingKeys: String, CodingKey {
        case min
        case max
        case value
        case image
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.min = try? container.decode(Int.self, forKey: .min)
        self.max = try? container.decode(Int.self, forKey: .max)
        self.value = try? container.decode(Int.self, forKey: .value)
        self.image = try container.decode(String.self, forKey: .image)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.value, forKey: .value)
        try container.encode(self.image, forKey: .image)
        try container.encode(self.min, forKey: .min)
        try container.encode(self.max, forKey: .max)
    }
}
