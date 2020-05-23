//
//  PageCreateBody.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 17/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct PageCreateBody: Encodable {
    public let name: String
    public let title: String
    public let label: String?
    public let logo: String?
    public let company: String?
    public let elements: [String]
    public let claim: Claim
    public let style: String?
}
