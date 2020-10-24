//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 13/10/2020.
//

import Foundation
import BSON

public struct AppearanceResponse: Codable {
    public let id: ObjectId?
    public let name: String
    public var prefix: String?
    public var suffix: String?
    public var size: Int?
    public var holderSize: Int?
    public var textSize: Double?
    public var selectionColor: String?
    public var backgroundColor: String?
    public var isExpanded: Bool?
    public let createdAt: Date?
    public let updatedAt: Date?
    public let deletedAt: Date?
    
    init(id: ObjectId?, name: String, prefix: String?, suffix: String?, size: Int?, holderSize: Int?, textSize: Double?, selectionColor: String?, backgroundColor: String?, isExpanded: Bool?, createdAt: Date?, updatedAt: Date?, deletedAt: Date?) {
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
    
    public init(from decoder: Decoder) throws {
        print("AppearanceResponse init 1")
        let container = try decoder.container(keyedBy: CodingKeys.self)
        print("AppearanceResponse init 2")
        self.id = try? container.decode(ObjectId.self, forKey: .id)
        print("AppearanceResponse init 3")
        self.name = try container.decode(String.self, forKey: .name)
        print("AppearanceResponse init 4")
        self.prefix = try? container.decode(String.self, forKey: .prefix)
        print("AppearanceResponse init 5")
        self.suffix = try? container.decode(String.self, forKey: .suffix)
        print("AppearanceResponse init 6")
        self.size = try? container.decode(Int.self, forKey: .size)
        print("AppearanceResponse init 7")
        self.holderSize = try? container.decode(Int.self, forKey: .holderSize)
        print("AppearanceResponse init 8")
        self.textSize = try? container.decode(Double.self, forKey: .textSize)
        print("AppearanceResponse init 9")
        self.selectionColor = try? container.decode(String.self, forKey: .selectionColor)
        print("AppearanceResponse init 10")
        self.backgroundColor = try? container.decode(String.self, forKey: .backgroundColor)
        print("AppearanceResponse init 11")
        self.isExpanded = try? container.decode(Bool.self, forKey: .isExpanded)
        print("AppearanceResponse init 12")
        self.createdAt = try? container.decode(Date.self, forKey: .createdAt)
        print("AppearanceResponse init 13")
        self.updatedAt = try? container.decode(Date.self, forKey: .updatedAt)
        print("AppearanceResponse init 14")
        self.deletedAt = try? container.decode(Date.self, forKey: .deletedAt)
        print("AppearanceResponse init 15")
    }

    
    public init(from appearance: Appearance) {
        print("AppearanceResponse id:", appearance.id)
        self.init(id: appearance.id, name: appearance.name, prefix: appearance.prefix, suffix: appearance.suffix, size: appearance.size, holderSize: appearance.holderSize, textSize: appearance.textSize, selectionColor: appearance.selectionColor, backgroundColor: appearance.backgroundColor, isExpanded: appearance.isExpanded, createdAt: appearance.createdAt, updatedAt: appearance.updatedAt, deletedAt: appearance.deletedAt)
    }
}
