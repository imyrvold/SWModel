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
    public var selectionColor: String?
    public var backgroundColor: String?
    public var isExpanded: Bool?
}
