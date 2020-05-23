//
//  ElementSimple.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 09/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

struct ElementSimple: Hashable, Identifiable {
    
    let id: String?
    var name: String
    var type: ElementType
    var data: String?
    var claim: Claim?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
