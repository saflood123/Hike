//
//  Hike.swift
//  Hike
//
//  Created by stuart flood on 04/08/2024.
//

import Foundation

struct Hike: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let photo: String
    let miles: Double
}
