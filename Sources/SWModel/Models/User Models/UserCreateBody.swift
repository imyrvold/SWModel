//
//  UserCreateBody.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 25/01/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct UserCreateBody: Encodable {
    public var firstName: String
    public var lastName: String
    public var email: String
    public var password: String
    public var role: String
    public var isHidden: Bool
    
    public init(firstName: String, lastName: String, email: String, password: String, role: String, isHidden: Bool) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        self.role = role
        self.isHidden = isHidden
    }
}
