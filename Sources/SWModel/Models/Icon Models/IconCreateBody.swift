//
//  IconCreateBody.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 16/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct IconCreateBody: Encodable {
    public let name: String
    public let icons: IconsCreateBody
    
    public init(name: String, icons: IconsCreateBody) {
        self.name = name
        self.icons = icons
    }
}

public struct IconsCreateBody: Encodable {
    public let min: Int?
    public let max: Int?
    public let value: Int?
    public let image: String
    
    public init(min: Int?, max: Int?, value: Int?, image: String) {
        self.min = min
        self.max = max
        self.value = value
        self.image = image
    }
}
