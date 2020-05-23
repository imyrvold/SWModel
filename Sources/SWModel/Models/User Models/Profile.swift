//
//  Profile.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 25/12/2019.
//  Copyright © 2019 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct Profile: Codable {
    public var firstName: String
    public var lastName: String
    public var email: String
    
    public init() {
        self.firstName = ""
        self.lastName = ""
        self.email = ""
    }
    
    public init(firstName: String, lastName: String, email: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
}
