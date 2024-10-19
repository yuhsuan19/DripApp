//
//  Item.swift
//  Drip
//
//  Created by Shane Chi on 2024/10/19.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
