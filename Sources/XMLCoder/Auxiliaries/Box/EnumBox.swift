//
//  EnumBox.swift
//  XMLCoder
//
//  Created by Benjamin Wetherfield on 6/30/19.
//

protocol EnumBox: Box {
    
    var name: CodingKey { get }
    
    static func unboxed (as name: CodingKey) -> KeyedBox?
    static func unboxed (as name: CodingKey) -> UnkeyedBox?
    static func unboxed (as name: CodingKey) -> SharedBox<KeyedBox>?
    static func unboxed (as name: CodingKey) -> SharedBox<UnkeyedBox>?
    static func unboxed (as name: CodingKey) -> SimpleBox?

}

extension EnumBox {
    var isNull: Bool {
        if let box = Self.unboxed(as: name) as KeyedBox? {
            return box.isNull
        } else if let box = Self.unboxed(as: name) as UnkeyedBox? {
            return box.isNull
        } else if let box = Self.unboxed(as: name) as SharedBox<KeyedBox>? {
            return box.isNull
        } else if let box = Self.unboxed(as: name) as SharedBox<UnkeyedBox>? {
            return box.isNull
        } else if let box = Self.unboxed(as: name) as SimpleBox? {
            return box.isNull
        } else { return true }
    }
    
    func xmlString() -> String? {
        if let box = Self.unboxed(as: name) as KeyedBox? {
            return box.xmlString()
        } else if let box = Self.unboxed(as: name) as UnkeyedBox? {
            return box.xmlString()
        } else if let box = Self.unboxed(as: name) as SharedBox<KeyedBox>? {
            return box.xmlString()
        } else if let box = Self.unboxed(as: name) as SharedBox<UnkeyedBox>? {
            return box.xmlString()
        } else if let box = Self.unboxed(as: name) as SimpleBox? {
            return box.xmlString()
        } else { return nil }
    }
}
