//
//  Menu.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 15/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation
import BSON

public struct Menu: Codable, Identifiable, Hashable, SidebarItemable {
    public let id: ObjectId?
    public var name: String
    public let claim: Claim
    public let submenus: [Submenu]
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    public var menuName: NavigationItem {
        .menus
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case name
        case claim
        case submenus
    }
    
    public init(id: ObjectId?, name: String, claim: Claim, submenus: [Submenu]) {
        self.id = id
        self.name = name
        self.claim = claim
        self.submenus = submenus
    }
}

extension Menu: Equatable {
    public static func == (lhs: Menu, rhs: Menu) -> Bool {
        return lhs.id == rhs.id
    }
    
}

extension Menu: Comparable {
    public static func < (lhs: Menu, rhs: Menu) -> Bool {
        return lhs.name < rhs.name
    }
}

public extension Menu {
    static var empty: Menu {
        return Menu(id: nil, name: "", claim: Claim.empty, submenus: [])
    }
    
    var isEmpty: Bool {
        return id == nil && name.isEmpty && claim.isEmpty && submenus.isEmpty
    }
}
