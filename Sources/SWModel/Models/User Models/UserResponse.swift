//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 27/07/2020.
//

import Foundation
import BSON

public struct UserResponse: Codable {
    public let id: ObjectId
    public let fullName: String
    public let email: String
    public let isHidden: Bool
    public var role: ObjectId
}
