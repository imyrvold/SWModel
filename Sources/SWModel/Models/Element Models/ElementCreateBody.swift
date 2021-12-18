//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 18/12/2021.
//

import Foundation
import BSON

public struct ElementCreateBody: Encodable {
    public var name: String
    public var claim: ObjectId
    public var type: ElementType
    public var data: ElementData?

    public init(name: String, claim: ObjectId, type: ElementType, data: ElementData?) {
        self.name = name
        self.claim = claim
        self.type = type
        self.data = data
    }
}

public extension ElementCreateBody {
    func httpBody() throws -> Data {
        try JSONEncoder().encode(self)
    }
}
