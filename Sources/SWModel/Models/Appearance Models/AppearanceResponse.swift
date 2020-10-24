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
    
    public init(from appearance: Appearance) {
        self.init(id: appearance.id, name: appearance.name, prefix: appearance.prefix, suffix: appearance.suffix, size: appearance.size, holderSize: appearance.holderSize, textSize: appearance.textSize, selectionColor: appearance.selectionColor, backgroundColor: appearance.backgroundColor, isExpanded: appearance.isExpanded, createdAt: appearance.createdAt, updatedAt: appearance.updatedAt, deletedAt: appearance.deletedAt)
    }
}
