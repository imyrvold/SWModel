//
//  SubmenuCreateBody.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 22/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

struct SubmenuCreateBody: Encodable {
    let name: String
    let claim: String
    let link: String
    let newTab: Bool?
}
