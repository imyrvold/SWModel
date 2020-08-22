//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 16/08/2020.
//

import Foundation

public struct ElementResponse: Codable {
   public  let id: String
    public var name: String
    public var type: ElementType
    public var data: ElementData?
    public var claim: String?
}
