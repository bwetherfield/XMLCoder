//
//  EnumBox.swift
//  XMLCoder
//
//  Created by Benjamin Wetherfield on 6/30/19.
//

protocol EnumBox: Box {
    
    var name: CodingKey { get }
    
    static func unboxed (as name: CodingKey) -> Box
}

extension EnumBox {
    var isNull: Bool {
        return Self.unboxed(as: name).isNull
    }
    
    func xmlString() -> String? {
        return Self.unboxed(as: name).xmlString()
    }
}
