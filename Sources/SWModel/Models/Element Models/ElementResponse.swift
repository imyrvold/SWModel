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
