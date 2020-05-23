//
//  CompanyCreateBody.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 16/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

public struct CompanyCreateBody: Encodable {
    public let title: String
    public let icons: [CompanyIcon]
    public let logo: String?
    public let def: Bool?
    public var buildingTabName: String?
    public var buildingUrl: String?
}
