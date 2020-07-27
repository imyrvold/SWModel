//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 26/07/2020.
//

import Foundation

public struct UserLoginResponse: Codable {
    public let id: String
    public let email: String
    public let fullName: String
    public let role: String
    
    public init(id: String, email: String, fullName: String, role: String) {
        self.id = id
        self.email = email
        self.fullName = fullName
        self.role = role
    }
    
    static var empty: UserLoginResponse {
        UserLoginResponse(id: "", email: "", fullName: "", role: "")
    }

}
