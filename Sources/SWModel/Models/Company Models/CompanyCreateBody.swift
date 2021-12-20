//
//  CompanyCreateBody.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 16/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation
import BSON

public struct CompanyCreateBody: Encodable {
    public var id: ObjectId?
    public let title: String
    public let icons: [CompanyIcon]
    public let logo: String?
    public let def: Bool?
    public var buildingTabName: String?
    public var buildingUrl: String?
    
    public init(id: ObjectId?, title: String, icons: [CompanyIcon], logo: String?, def: Bool?, buildingTabName: String?, buildingUrl: String?) {
        self.id = id
        self.title = title
        self.icons = icons.map { CompanyIcon(id: UUID(), name: $0.name, link: $0.link, content: $0.content, rel: $0.rel, type: $0.type, href: $0.href, sizes: $0.sizes, color: $0.color) }
        print("CompanyCreateBody init icons:", self.icons)
        self.logo = logo
        self.def = def
        self.buildingTabName = buildingTabName
        self.buildingUrl = buildingUrl
    }
}

public extension CompanyCreateBody {
    func httpBody() throws -> Data {
        try JSONEncoder().encode(self)
    }
}
