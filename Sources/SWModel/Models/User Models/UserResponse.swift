//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 27/07/2020.
//

import Foundation

public struct UserResponse: Codable {
    public let id: String
    public let fullName: String
    public let email: String
    public let isHidden: Bool
    public var roles: [String]
}
