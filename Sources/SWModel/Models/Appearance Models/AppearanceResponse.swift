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
}
