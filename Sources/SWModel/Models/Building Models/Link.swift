//
//  Link.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 29/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct Link: Identifiable {
    public let id: String
    public var group: String
    public let label: String
    public let link: String
    public let newTab: Bool
}

extension Link: Codable {
    public enum CodingKeys: String, CodingKey {
        case id = "_id"
        case group
        case label
        case link
        case newTab
    }
}
