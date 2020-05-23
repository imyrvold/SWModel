//
//  ElementSimple.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 09/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct ElementSimple: Hashable, Identifiable {
    
    public let id: String?
    public var name: String
    public var type: ElementType
    public var data: String?
    public var claim: Claim?
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
