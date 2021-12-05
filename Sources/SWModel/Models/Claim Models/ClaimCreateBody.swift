//
//  ClaimCreateBody.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 02/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct ClaimCreateBody: Encodable {
    public var name: String
    
    public init(name: String) {
        self.name = name
    }
}

public extension ClaimCreateBody {
    func httpBody() throws -> Data {
        try JSONEncoder().encode(self)
    }
}
