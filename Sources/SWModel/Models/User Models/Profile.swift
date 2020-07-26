//
//  Profile.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 25/12/2019.
//  Copyright © 2019 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct Profile: Codable {
    public var fullName: String
    public var email: String
    
    public init() {
        self.fullName = ""
        self.email = ""
    }
    
    public init(fullName: String, email: String) {
        self.fullName = fullName
        self.email = email
    }
}
