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

enum IntOrString: EnumBox {
    var unboxed: Box {
        switch self {
        case let .int(intBox): return intBox
        case let .string(stringBox): return stringBox
        }
    }
    case int(IntBox)
    case string(StringBox)
}
