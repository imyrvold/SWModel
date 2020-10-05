//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 27/07/2020.
//

import Foundation
import BSON

public struct RoleResponse: Codable {
    public let id: ObjectId?
    public let name: String
    public var claims: [ObjectId]
}
