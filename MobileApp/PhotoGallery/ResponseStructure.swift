//
//  ResponseStructure.swift
//  MobileApp
//
//  Created by Yulia Ignateva on 25.04.2022.
//

import UIKit

struct Model: Decodable {
    let response: Response
}

struct Response: Decodable {
    let count: Int
    let items: [Items]
}

struct Items: Decodable {
    let date: Int
    let sizes: [Sizes]
}

struct Sizes: Decodable {
    let height: Int
    let url: URL
    let width: Int
}
