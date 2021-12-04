//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 13/09/2020.
//

import Foundation
import BSON

public struct ClaimResponse: Codable {
    public let id: ObjectId
    public let name: String
    public let createdAt: String
    public let updatedAt: String
    public let deletedAt: String?
}
