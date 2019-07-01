//
//  IntOrStringBoxTests.swift
//  XMLCoderTests
//
//  Created by Benjamin Wetherfield on 7/1/19.
//

import Foundation
import XCTest
@testable import XMLCoder

private let intOrStringContainer = """
<?xml version="1.0" encoding="UTF-8"?>
<container>
  <int>42</int>
</container>
""".data(using: .utf8)!

private struct IntOrStringContainer: Decodable {
    var intOrString: IntOrString
}

final class IntOrStringBoxTests: XCTestCase {

    func testDecoding() throws {
        let decoder = XMLDecoder()
        
        let container = try decoder.decode(IntOrStringContainer.self, from: intOrStringContainer)
        switch container.intOrString {
        case let .int(value): XCTAssertEqual(value, 42)
        default:
            XCTAssert(false)
        }
    }
}
