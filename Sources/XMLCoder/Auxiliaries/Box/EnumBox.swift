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

enum IntOrStringBox: EnumBox {
    var unboxed: Box {
        switch self {
        case let .int(intBox): return intBox
        case let .string(stringBox): return stringBox
        }
    }
    case int(IntBox)
    case string(StringBox)
}

enum IntOrString {
    case int(Int)
    case string(String)
}

extension XMLEncoderImplementation {
    func box (_ intOrString: IntOrString) -> IntOrStringBox {
        switch intOrString {
        case let .int(value): return IntOrStringBox.int(IntBox(value))
        case let .string(value): return IntOrStringBox.string(StringBox(value))
        }
    }
}

extension XMLDecoderImplementation {
    
    func unbox<T: Decodable>(_ box: EnumBox) throws -> T {
        do {
            return try unbox(box.unboxed) as T
        } catch {
            throw error
        }
    }
}
