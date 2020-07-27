//
//  UserCreateResponse.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 09/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct UserCreateResponse: Decodable {
    public let id: String
    public var email: String
    public var fullName: String
    public var isHidden: Bool
    public var role: String
    
    public init(id: String, email: String, fullName: String, isHidden: Bool, role: String) {
        self.id = id
        self.email = email
        self.fullName = fullName
        self.isHidden = isHidden
        self.role = role
    }
}
