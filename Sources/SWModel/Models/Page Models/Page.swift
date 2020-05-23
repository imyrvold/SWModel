//
//  Page.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 15/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct Page: Identifiable, Hashable {
    public let id: String
    public var name: String
    public let title: String
    public let label: String?
    public let claim: Claim
    public var claims: [Claim] = []
    public var elements: [Element] = []
    public let logo: String?
    public let company: Company?
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

typealias PagesResponse = [Page]

extension Page: Codable {
    public enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case title
        case label
        case claim
        case claims
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
        return Page(id: "", name: "", title: "", label: nil, claim: Claim.empty, claims: [], elements: [], logo: nil, company: Company.empty)
    }
}
