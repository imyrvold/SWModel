//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 16/08/2020.
//

import Foundation
import BSON

public struct ElementResponse: Codable {
   public  let id: ObjectId
    public var name: String
    public var type: ElementType
    public var data: ElementData?
    public var claim: String?
}

public extension ElementResponse {
//    static func elementResponse(from response: ElementResponse) -> ElementResponse {
//        Element(id: response.id.hexString, name: response.name, claim: response.claim, createdAt: response.createdAt, updatedAt: response.updatedAt, deletedAt: response.deletedAt)
//    }

    static func json(from response: [ElementResponse]) throws -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
//        let elementsOutput = response.map { Self.elementResponse(from: $0) }
        
        let elementsData = try encoder.encode(response)
        if let json = String(data: elementsData, encoding: .utf8) {
            return json
        }
        return "Couldn't convert response to JSON"
    }

    static func json(from response: ElementResponse) throws -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
//        let elementOutput = Self.elementResponse(from: response)
        
        let elementsData = try encoder.encode(response)
        if let json = String(data: elementsData, encoding: .utf8) {
            return json
        }
        return "Couldn't convert response to JSON"
    }

}
