//
//  LEGOSet.swift
//  LegoCollection
//
//  Created by Hüseyin Kaya on 2.02.2024.
//

import Foundation


struct LEGOSetResponse: Codable {
    let status: String
    let matches: Int
    let sets: [LEGOSet]
}

struct LEGOSet: Codable {
    let number: String
    let name: String
    let year: Int
    let theme: String
    let pieces: Int
}
