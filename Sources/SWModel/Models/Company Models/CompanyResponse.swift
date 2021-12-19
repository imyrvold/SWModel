//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 19/12/2021.
//

import Foundation
import BSON

public struct CompanyResponse: Codable {
    public let id: ObjectId
    public var title: String
    public var icons: [CompanyIcon]
    public var logo: String?
    public var def: Bool
    public var buildingTabName: String?
}
