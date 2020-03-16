//
//  TestOptionalFieldIsTrulyOptional.swift
//  ApiJsonKit_Tests
//
//  Created by Bach Le on 3/16/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest

class TestOptionalFieldIsTrulyOptional: XCTestCase {
        
    func testOptionalFieldIsNotTrulyOptional() {
        // I have declared Item as optional
        // I always expected this data to be parsed as
        // Model with id and nil Item
        // But the whole Model fails to parse
        let data = """
        {
            "id": "1",
            "item": {}
        }
        """.data(using: .utf8)!
        
        let nilParseResult = try? JSONDecoder().decode(NotTrulyOptionalFieldModel.self , from: data)
        XCTAssertNil(nilParseResult)
    }
    
    func testParseOptionalFieldWhenKeyIsPresent() {
        let data = """
        {
            "id": "1",
            "item": {}
        }
        """.data(using: .utf8)!
        
        let modelWithTrulyOptionalField = try? JSONDecoder().decode(TrulyOptionalFieldModel.self , from: data)
        XCTAssertNotNil(modelWithTrulyOptionalField)
        
        XCTAssertEqual(modelWithTrulyOptionalField?.id, "1")
        XCTAssertNil(modelWithTrulyOptionalField?.item?.value)
    }
    
    func testParseOptionalFieldWhenKeyIsMissing() {
        let data = """
        {
            "id": "1",
        }
        """.data(using: .utf8)!
        
        let modelWithTrulyOptionalField = try? JSONDecoder().decode(TrulyOptionalFieldModel.self , from: data)
        XCTAssertNotNil(modelWithTrulyOptionalField)
        
        XCTAssertEqual(modelWithTrulyOptionalField?.id, "1")
        XCTAssertNil(modelWithTrulyOptionalField?.item?.value)
    }
}

fileprivate struct Item: Decodable {
    let name: String
}

fileprivate struct NotTrulyOptionalFieldModel: Decodable {
    let id: String
    let item: Item?
}

fileprivate struct TrulyOptionalFieldModel: Decodable {
    let id: String
    let item: OptionalDecodable<Item>?
}
