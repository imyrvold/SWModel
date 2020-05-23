//
//  PageCreateBody.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 17/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

struct PageCreateBody: Encodable {
    let name: String
    let title: String
    let label: String?
    let logo: String?
    let company: String?
    let elements: [String]
    let claim: Claim
    let style: String?
}
