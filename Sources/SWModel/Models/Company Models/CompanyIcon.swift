//
//  CompanyIcon.swift
//  DuncanIdaho
//
//  Created by Ivan C Myrvold on 16/02/2020.
//  Copyright © 2020 Ivan C Myrvold. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#else
import AppKit
#endif

public struct CompanyIcon: Identifiable {
    public let id = UUID()
    public var name: String?
    public var link: Bool
    public var content: String?
    public var rel: String?
    public var type: String?
    public var href: String?
    public var sizes: String?
    #if os(iOS)
    public var color: UIColor?
    #else
    public var color: NSColor?
    #endif
}

extension CompanyIcon: Equatable {
    public static func == (lhs: CompanyIcon, rhs: CompanyIcon) -> Bool {
        return lhs.id == rhs.id
    }
    
}

extension CompanyIcon: Codable {
    public enum CodingKeys: String, CodingKey {
        case name
        case link
        case content
        case rel
        case type
        case href
        case sizes
        case color
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try? container.decode(String.self, forKey: .name)
        self.link = try container.decode(Bool.self, forKey: .link)
        self.content = try? container.decode(String.self, forKey: .content)
        self.rel = try? container.decode(String.self, forKey: .rel)
        self.type = try? container.decode(String.self, forKey: .type)
        self.href = try? container.decode(String.self, forKey: .href)
        self.sizes = try? container.decode(String.self, forKey: .sizes)
        if let hex = try? container.decode(String.self, forKey: .color), hex.count == 7 {
            #if os(iOS)
                self.color = UIColor(hexString: hex)
            #else
                self.color = NSColor(hexString: hex)
            #endif
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        if let name = self.name {
            try container.encode(name, forKey: .name)
        }
        try container.encode(self.link, forKey: .link)
        if let content = self.content {
            try container.encode(content, forKey: .content)
        }
        if let rel = self.rel {
            try container.encode(rel, forKey: .rel)
        }
        if let type = self.type {
            try container.encode(type, forKey: .type)
        }
        if let href = self.href {
            try container.encode(href, forKey: .href)
        }
        if let sizes = self.sizes {
            try container.encode(sizes, forKey: .sizes)
        }
        if let color = self.color {
            try container.encode(color.toHexString(), forKey: .color)
        }
    }
}

#if os(iOS)
public extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")

        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }

    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}
#else
public extension NSColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")

        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }

    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}
#endif
