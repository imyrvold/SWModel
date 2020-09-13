//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 13/09/2020.
//

import Foundation

public struct ClaimResponse: Decodable {
    public let id: String
    public let name: String
    public let createdAt: String
    public let updatedAt: String
    public let deletedAt: String?
}
