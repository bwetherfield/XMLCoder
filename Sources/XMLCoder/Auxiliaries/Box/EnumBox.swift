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
    
extension IntOrString: Decodable {
    enum CodingKeys: String, CodingKey {
        case int
        case string
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            self = .int(try container.decode(Int.self, forKey: .int))
        } catch {
            self = .string(try container.decode(String.self, forKey: .string))
        }
    }

}

extension XMLEncoderImplementation {
    func box(_ intOrString: IntOrString) -> IntOrStringBox {
        switch intOrString {
        case let .int(value): return IntOrStringBox.int(IntBox(value))
        case let .string(value): return IntOrStringBox.string(StringBox(value))
        }
    }
}

extension XMLDecoderImplementation {
    
    func unbox(_ box: IntOrStringBox) throws -> IntOrString {
        do {
            switch box {
            case .int:
                let value = try unbox(box.unboxed) as Int
                return IntOrString.int(value)
            case .string:
                let value = try unbox(box.unboxed) as String
                return IntOrString.string(value)
            }
        } catch {
            throw error
        }
    }
}
