//
//  EnumBox.swift
//  XMLCoder
//
//  Created by Benjamin Wetherfield on 6/30/19.
//

protocol EnumBox: Box {
    
    var unboxed: Box { get }
}

extension EnumBox {
    var isNull: Bool {
        return unboxed.isNull
    }
    
    func xmlString() -> String? {
        return unboxed.xmlString()
    }
}
