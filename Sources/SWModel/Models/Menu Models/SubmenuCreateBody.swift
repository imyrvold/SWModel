//
//  SubmenuCreateBody.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 22/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct SubmenuCreateBody: Encodable {
    public let name: String
    public let claim: String
    public let link: String
    public let newTab: Bool?
    
    public init(name: String, claim: String, link: String, newTab: Bool?) {
        self.name = name
        self.claim = claim
        self.link = link
        self.newTab = newTab
    }

}
