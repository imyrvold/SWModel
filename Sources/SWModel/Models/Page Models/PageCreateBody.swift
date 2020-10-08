//
//  PageCreateBody.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 17/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation
import BSON

public struct PageCreateBody: Encodable {
    public let name: String
    public let title: String
    public let label: String?
    public let logo: String?
    public let company: String?
    public let elements: [ObjectId]
    public let claim: Claim
    public let style: String?
    
    public init(name: String, title: String, label: String?, logo: String?, company: String?, elements: [ObjectId], claim: Claim, style: String?) {
        self.name = name
        self.title = title
        self.label = label
        self.logo = logo
        self.company = company
        self.elements = elements
        self.claim = claim
        self.style = style
    }
}
