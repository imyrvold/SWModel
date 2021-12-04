//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 04/12/2021.
//

import Foundation

public struct LoginBody: Encodable {
    public var email: String
    public var password: String
    
    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}

extension LoginBody {
    func httpBody() throws -> Data {
        try JSONEncoder().encode(self)
    }
}
