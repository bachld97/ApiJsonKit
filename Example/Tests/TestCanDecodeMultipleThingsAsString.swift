//
//  TestCanDecodeMultipleThingsAsString.swift
//  ApiJsonKit_Tests
//
//  Created by Bach Le on 3/16/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest

class TestCanDecodeMultipleThingsAsString: XCTestCase {
    
    func testCanDecodeUInt64AsDecodableString() {
        let data = """
        {
            "string": \(UINT64_MAX)
        }
        """.data(using: .utf8)!
        
        let stringFromUInt = (try? JSONDecoder().decode(ModelDecodable.self , from: data))?.stringValue ?? ""
        let nilParseResult = try? JSONDecoder().decode(ModelNotDecodable.self , from: data)

        XCTAssertNil(nilParseResult)
        XCTAssertEqual(stringFromUInt, "\(UINT64_MAX)")
    }
    
    func testCanDecodeNegativeInt64AsDecodableString() {
           let data = """
           {
               "string": -123123
           }
           """.data(using: .utf8)!
           
           let stringFromInt = (try? JSONDecoder().decode(ModelDecodable.self , from: data))?.stringValue ?? ""
           let nilParseResult = try? JSONDecoder().decode(ModelNotDecodable.self , from: data)

           XCTAssertNil(nilParseResult)
           XCTAssertEqual(stringFromInt, "-123123")
       }

    func testCanDecodeDoubleAsDecodableString() {
        let data = """
        {
            "string": -123.2345
        }
        """.data(using: .utf8)!
        
        let stringFromDouble = (try? JSONDecoder().decode(ModelDecodable.self , from: data))?.stringValue ?? ""
        let nilParseResult = try? JSONDecoder().decode(ModelNotDecodable.self , from: data)
        
        XCTAssertNil(nilParseResult)
        XCTAssertEqual(stringFromDouble, "-123.2345")
    }
    
    func testCanDecodeStringAsDecodableString() {
        let data = """
        {
            "string": "trivial case"
        }
        """.data(using: .utf8)!
        
        let stringFromString = (try? JSONDecoder().decode(ModelDecodable.self , from: data))?.stringValue ?? ""
        XCTAssertEqual(stringFromString, "trivial case")
    }
}

fileprivate class ModelDecodable: Decodable {
    let string: DecodableString
    
    var stringValue: String {
        return string.stringValue
    }
}

fileprivate class ModelNotDecodable: Decodable {
    let string: String
}
