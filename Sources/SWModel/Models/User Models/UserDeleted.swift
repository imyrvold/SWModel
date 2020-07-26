//
//  UserDeleted.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 08/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct UserDeleted: Codable {
    public let id: String
    public var fullName: String
    public var email: String
    public var role: String
    
    public init(id: String, fullName: String, email: String, role: String) {
        self.id = id
        self.fullName = fullName
        self.email = email
        self.role = role
    }
    
}
