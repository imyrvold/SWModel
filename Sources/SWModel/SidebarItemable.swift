//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 05/09/2020.
//

import Foundation

public enum NavigationItem {
    case home, claims, roles, users, tags, pages, menus, links, icons, elements, companies, buildings, behaviours, appearances
    
    public var name: String {
        switch self {
        case .home:
            return "Home"
        case .claims:
            return "Claims"
        case .roles:
            return "Roles"
        case .users:
            return "Users"
        case .tags:
            return "Tags"
        case .pages:
            return "Pages"
        case .menus:
            return "Menus"
        case .links:
            return "Links"
        case .icons:
            return "Icons"
        case .elements:
            return "Elements"
        case .companies:
            return "Companies"
        case .buildings:
            return "Buildings"
        case .behaviours:
            return "Behaviours"
        case .appearances:
            return "Appearances"
        }
    }
}



public protocol SidebarItemable {
    var name: String { get }
    var menuName: NavigationItem { get }
}
