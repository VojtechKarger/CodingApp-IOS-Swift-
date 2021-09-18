//
//  Model.swift
//  Model
//
//  Created by vojta on 18.09.2021.
//

import Foundation

struct Response: Codable {
    let errors, version, output: String
}

struct Request: Encodable {
    let toolchain_version = "5.4.3"
    let code: String
}

