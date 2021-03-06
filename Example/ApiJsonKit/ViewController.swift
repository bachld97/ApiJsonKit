//
//  ViewController.swift
//  ApiJsonKit
//
//  Created by Bach Le on 03/16/2020.
//  Copyright (c) 2020 Bach Le. All rights reserved.
//

import UIKit
import ApiJsonKit

struct TestStruct: Decodable {
    let testString: DecodableString
    let testOptional: OptionalDecodable<String>?
    let testArray: DecodableArray<String>
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

