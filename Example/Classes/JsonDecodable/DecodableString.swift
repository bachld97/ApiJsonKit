//
//  DecodableString.swift
//  ApiJsonKit
//
//  Created by Bach Le on 3/16/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
/*
 * Built-in Decodable cannot treat Number/Bool as String
 * DecodableString help parse Number/Bool as String
 */
class DecodableString: Decodable {
    let stringValue: String
    
    init(string: String) {
        self.stringValue = string
    }
    
    // Decoding data order: UInt64, Int64, Double, String
    required init(from decoder: Decoder) throws {
        var result: String?
        result = try? "\(decoder.singleValueContainer().decode(UInt64.self))"
        result = result ?? (try? "\(decoder.singleValueContainer().decode(Int64.self))")
        result = result ?? (try? "\(decoder.singleValueContainer().decode(Double.self))")
        
        if let result = result {
            stringValue = result
        } else {
            // If decoding as String fails, propagate error
            stringValue = try decoder.singleValueContainer().decode(String.self)
        }
    }
}
