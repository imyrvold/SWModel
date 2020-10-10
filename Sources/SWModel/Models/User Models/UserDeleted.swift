//
//  UserDeleted.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 08/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation
import BSON

public struct UserDeleted: Codable {
    public let id: ObjectId
    public var fullName: String
    public var email: String
    public var role: ObjectId
    
    public init(id: ObjectId, fullName: String, email: String, role: ObjectId) {
        self.id = id
        self.fullName = fullName
        self.email = email
        self.role = role
    }
    
}
