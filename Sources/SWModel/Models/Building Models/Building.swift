//
//  Building.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 15/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation
import BSON

public struct Building: Identifiable, SidebarItemable {
    public let id: ObjectId?
    public var name: String
    public let address: String?
    public let imageUrl: URL?
    public let index: Page?
    public var pages: [Page]?
    public var menus: [Menu]?
    public var links: [Link]?
    public var position: Int?
    public let claim: Claim
    public let company: Company?
    public var isShowing = false
    public var menuName: NavigationItem {
        .buildings
    }
}

extension Building: Codable {
    public enum CodingKeys: String, CodingKey {
        case id
        case name
        case address
        case imageUrl
        case index
        case pages
        case menus
        case links
        case position
        case claim
        case company
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try? container.decode(ObjectId.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.address = try? container.decode(String.self, forKey: .address)
        if let imageUrlStr = try? container.decode(String.self, forKey: .imageUrl) {
            self.imageUrl = URL(string: imageUrlStr)
        } else {
            self.imageUrl = nil
        }
        self.index = try? container.decode(Page.self, forKey: .index)
        self.pages = try? container.decode([Page].self, forKey: .pages)
        self.menus = try? container.decode([Menu].self, forKey: .menus)
        self.links = try? container.decode([Link].self, forKey: .links)
        self.position = try? container.decode(Int.self, forKey: .position)
        self.claim = try container.decode(Claim.self, forKey: .claim)
        self.company = try? container.decode(Company.self, forKey: .company)
    }
    
    public init(id: ObjectId, name: String, address: String?, imageUrl: URL?, index: Page?, pages: [Page]?, menus: [Menu]?, links: [Link]?, position: Int?, claim: Claim, company: Company?) {
        self.id = id
        self.name = name
        self.address = address
        self .imageUrl = imageUrl
        self.index = index
        self.pages = pages
        self.menus = menus
        self.links = links
        self.position = position
        self.claim = claim
        self.company = company
    }
}

extension Building: Equatable {
    public static func == (lhs: Building, rhs: Building) -> Bool {
        return lhs.id == rhs.id
    }
    
}

extension Building: Comparable {
    public static func < (lhs: Building, rhs: Building) -> Bool {
        if let lhp = lhs.position, let rhp = rhs.position {
            return lhp < rhp
        }
        return lhs.name < rhs.name
    }
}

public extension Building {
    static var empty: Building {
        return Building(id: nil, name: "", address: nil, imageUrl: nil, index: nil, pages: nil, menus: nil, links: nil, position: nil, claim: Claim.empty, company: nil)   }
}
