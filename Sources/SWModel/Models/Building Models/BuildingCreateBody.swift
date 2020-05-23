//
//  BuildingCreateBody.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 29/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct BuildingCreateBody: Encodable {
    let name: String
    let address: String?
    let imageUrl: String?
    let index: String?
    let pages: [String]?
    let menus: [String]?
    let links: [Link]?
    let position: Int?
    let claim: String
    let company: String?
}
