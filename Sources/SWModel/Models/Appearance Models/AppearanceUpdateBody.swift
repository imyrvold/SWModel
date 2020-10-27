//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 17/10/2020.
//

import Foundation

public struct AppearanceUpdateBody: Codable, CustomDebugStringConvertible {
    
    public var name: String?
    public var prefix: String?
    public var suffix: String?
    public var size: Int?
    public var holderSize: Int?
    public var textSize: Double?
    public var selectionColor: String?
    public var backgroundColor: String?
    public var isExpanded: Bool?
    
//    public init(name: String?, prefix: String? = nil, suffix: String? = nil, size: Int? = nil, holderSize: Int? = nil, textSize: Double? = nil, selectionColor: String? = nil, backgroundColor: String? = nil, isExpanded: Bool? = nil) {
//        self.name = name
//        self.prefix = prefix
//        self.suffix = suffix
//        self.size = size
//        self.holderSize = holderSize
//        self.textSize = textSize
//        self.selectionColor = selectionColor
//        self.backgroundColor = backgroundColor
//        self.isExpanded = isExpanded
//    }
    
     public mutating func clear() {
        self.name = nil
        self.prefix = nil
        self.suffix = nil
        self.size = nil
        self.holderSize = nil
        self.textSize = nil
        self.selectionColor = nil
        self.backgroundColor = nil
        self.isExpanded = nil
    }

    public var debugDescription: String {
        let name = self.name ?? "nil"
        let prefix = self.prefix ?? "nil"
        let suffix = self.suffix ?? "nil"
        let sizeString: String
        if let size = self.size {
            sizeString = String(size)
        } else {
            sizeString = "nil"
        }
        let holderSizeString: String
        if let holderSize = self.holderSize {
            holderSizeString = String(holderSize)
        } else {
            holderSizeString = "nil"
        }
        let textSizeString: String
        if let textSize = self.textSize {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            numberFormatter.maximumFractionDigits = 1
            textSizeString = numberFormatter.string(from: NSNumber(value: textSize)) ?? "nil"
        } else {
            textSizeString = "nil"
        }
        let selectionColor = self.selectionColor ?? "nil"
        let backgroundColor = self.backgroundColor ?? "nil"
        let isExpandedString: String
        if let isExpanded = self.isExpanded {
            isExpandedString = String(isExpanded)
        } else {
            isExpandedString = "nil"
        }
        
        return "name: \(name) prefix: \(prefix) suffix: \(suffix) size: \(sizeString) holderSize: \(holderSizeString) textSize: \(textSizeString) selectionColor: \(selectionColor) backgroundColor: \(backgroundColor) isExpanded: \(isExpandedString)"
    }
}
