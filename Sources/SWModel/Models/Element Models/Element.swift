//
//  Element.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 30/12/2019.
//  Copyright © 2019 Ivan C Myrvold. All rights reserved.
//

import Foundation
import BSON

public struct Element: Hashable, Identifiable, SidebarItemable {
    
   public  let id: ObjectId?
    public var name: String
    public var type: ElementType
    public var data: ElementData?
    public var claim: Claim?
    public var menuName: NavigationItem {
        .elements
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Element: Equatable {
    public static func == (lhs: Element, rhs: Element) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Element: Comparable {
    public static func < (lhs: Element, rhs: Element) -> Bool {
        return lhs.name < rhs.name
    }
}

extension Element {
    public func isEqual(to element: Element) -> Bool {
        return self.name == element.name && self.type == element.type && self.data == element.data && self.claim == element.claim
    }
}
extension Element: Codable {}

