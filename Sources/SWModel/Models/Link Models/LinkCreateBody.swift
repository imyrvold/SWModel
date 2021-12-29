//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 29/12/2021.
//

import Foundation
import BSON

public struct LinkCreateBody: Encodable {
    public let id: ObjectId?
    public let group: String
    public let label: String
    public let link: String
    public let newTab: Bool
    
    public init(id: ObjectId?, group: String, label: String, link: String, newTab: Bool) {
        self.id = id
        self.group = group
        self.label = label
        self.link = link
        self.newTab = newTab
    }
}

public extension LinkCreateBody {
    func httpBody() throws -> Data {
        try JSONEncoder().encode(self)
    }
}
