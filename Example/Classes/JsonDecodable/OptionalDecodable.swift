//
//  OptionalDecodable.swift
//  ApiJsonKit
//
//  Created by Bach Le on 3/16/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation

/*
 * Decoding will fail when CodingKey of an Optional field
 * is present, but its data is unexpected.
 *
 * OptionalDecodable helps cover cases where CodingKey for Optional field
 * is present, but the data is not decodable.
 */
public class OptionalDecodable<Element: Decodable>: Decodable {

    let value: Element?
    
    required public init(from decoder: Decoder) throws {
        do {
            let container = try decoder.singleValueContainer()
            self.value = try container.decode(Element.self)
        } catch {
            self.value = nil
        }
    }
}
