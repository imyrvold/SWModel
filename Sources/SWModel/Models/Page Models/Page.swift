//
//  Page.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 15/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation
import BSON

public struct Page: Identifiable, Hashable, SidebarItemable {
    public let id: ObjectId?
    public var name: String
    public let title: String
    public let label: String?
    public let claim: Claim
    public var elements: [Element] = []
    public let logo: String?
    public let company: Company?
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    public var menuName: NavigationItem {
        .pages
    }

    public init(id: ObjectId?, name: String, title: String, label: String?, claim: Claim, elements: [Element], logo: String?, company: Company?) {
        self.id = id
        self.name = name
        self.title = title
        self.label = label
        self.claim = claim
        self.elements = elements
        self.logo = logo
        self.company = company
    }
}

extension Page: Codable {
    public enum CodingKeys: String, CodingKey {
        case id
        case name
        case title
        case label
        case claim
        case elements
        case logo
        case company
    }
}
extension Page: Equatable {
    public static func == (lhs: Page, rhs: Page) -> Bool {
        return lhs.id == rhs.id
    }
    
}

extension Page: Comparable {
    public static func < (lhs: Page, rhs: Page) -> Bool {
        return lhs.name < rhs.name
    }
}

public extension Page {
    static var empty: Page {
        return Page(id: nil, name: "", title: "", label: nil, claim: Claim.empty, elements: [], logo: nil, company: Company.empty)
    }
}
