//
//  BehaviourCreateBody.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 13/04/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

import Foundation

public struct BehaviourCreateBody: Encodable {
    public var name: String
    public var min: Int?
    public var max: Int?
    public var numberOfDecimals: Int?
    public var orientation: Orientation?
    public var options: [String]?
}
