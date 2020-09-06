//
//  Link.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 29/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct Link: Codable, Identifiable, SidebarItemable {
    public var name: String {
        label
    }
    public var menuName: NavigationItem {
        .links
    }

    public let id: String
    public var group: String
    public let label: String
    public let link: String
    public let newTab: Bool
    
    public init(id: String, group: String, label: String, link: String, newTab: Bool) {
        self.id = id
        self.group = group
        self.label = label
        self.link = link
        self.newTab = newTab
    }
}

public extension Link {
    static var empty: Link {
        return Link(id: "", group: "", label: "", link: "", newTab: false)
    }
}

extension Link: Equatable {
    public static func == (lhs: Link, rhs: Link) -> Bool {
        return lhs.id == rhs.id
    }
}
