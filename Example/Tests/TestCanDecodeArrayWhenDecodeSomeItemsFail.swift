//
//  TestCanDecodeArrayWhenDecodeSomeItemsFail.swift
//  ApiJsonKit_Tests
//
//  Created by Bach Le on 3/16/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest

class TestCanDecodeArrayWhenDecodeSomeItemsFail: XCTestCase {

    func testDefaultDecodableCannotBeParsed() {
        // I expected that whichever items within an array cannot be decoded,
        // The array will end up ignoring it.
        // However, the whole array and subsequently the model fail to be decoded.
        let data = """
        {
            "items": [{"name": "First"}, {"broken": "This failed to parse"}]
        }
        """.data(using: .utf8)!
        
        let nilParseResult = try? JSONDecoder().decode(CollectionCannotBeParsed.self , from: data)
        XCTAssertNil(nilParseResult)
    }
    
    func testCustomDecodableCanBeParsed() {
        let data = """
        {
            "items": [
                {"name": "First"},
                {"name": "Second"},
                {"ignored": "This is only ignored, does not corrupt"},
                {}
            ]
        }
        """.data(using: .utf8)!
        
        // Assert default Decodable fail to parse this data
        let nilParseResult = try? JSONDecoder().decode(CollectionCannotBeParsed.self , from: data)
        XCTAssertNil(nilParseResult)
        
        // Assert custom Decodable can parse this data
        let arrayWithoutCorruptedItems = try? JSONDecoder().decode(CollectionCanBeParsed.self , from: data)
        XCTAssertNotNil(arrayWithoutCorruptedItems)
        XCTAssertEqual(arrayWithoutCorruptedItems?.items.elements.count, 2)
    }
}

fileprivate struct Item: Decodable {
    let name: String
}

fileprivate struct CollectionCanBeParsed: Decodable {
    let items: DecodableArray<Item>
}

fileprivate struct CollectionCannotBeParsed: Decodable {
    let items: [Item]
}
