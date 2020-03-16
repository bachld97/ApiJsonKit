//
//  DecodableArray.swift
//  ApiJsonKit
//
//  Created by Bach Le on 3/16/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation

/*
 * The process of decoding an array of item will fail if
 * there exists at least one item that cannot be decoded
 *
 * DecodableArray ignores items which cannot be decoded
 * and continues to decode other items
 */
public class DecodableArray<Element: Decodable>: Decodable {
    let elements: [Element]
    
    required public init(from decoder: Decoder) throws {
        do {
            let container = try decoder.singleValueContainer()
            let values = try container.decode([OptionalDecodable<Element>].self)
            self.elements = values.compactMap { $0.value }
        } catch {
            self.elements = []
        }
    }
}
