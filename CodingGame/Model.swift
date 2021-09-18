//
//  Model.swift
//  Model
//
//  Created by vojta on 18.09.2021.
//

import UIKit

struct Response: Codable {
    let errors, version, output: String
}

struct Request: Encodable {
    let toolchain_version = "5.4.3"
    let code: String
}

struct Attributes {
    static let attributes: [String : UIColor] = ["print": .systemBlue,"{": .systemMint,"}": .systemMint,"if": .systemGreen,"else": .systemGreen,"import": .systemPink]
}
