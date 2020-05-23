//
//  IconCreateBody.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 16/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

struct IconCreateBody: Encodable {
    let name: String
    let icons: IconsCreateBody
}

struct IconsCreateBody: Encodable {
    let min: Int?
    let max: Int?
    let value: Int?
    let image: String
}
