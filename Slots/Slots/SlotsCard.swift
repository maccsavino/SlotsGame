//
//  SlotsCard.swift
//  Slots
//
//  Created by Kevin Savinovich on 4/14/23.
//

import Foundation
struct SlotsCard : Identifiable, Hashable, Equatable {
    var shape: Shapes
    var shade: Shades
    var color: Colors
    var count: Int
    var id: Int
    
    enum Shapes {
        case triangleUp
        case triangleRight
        case triangleDown
        case triangleLeft
        
        static var all = [Shapes.triangleUp, .triangleRight, .triangleDown, .triangleLeft]

    }
    
    enum Shades {
        case outlined
        case striped
        case filled
        
        static var all = [Shades.outlined, .striped, .filled]
    }

    enum Colors {
        case red
        case green
        case purple
        case blue
        
        static var all = [Colors.red, .green, .purple, .blue]
    }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(shape)
            hasher.combine(shade)
            hasher.combine(color)
            hasher.combine(count)
            hasher.combine(id)
        }

    
    
    init(shape: Shapes, shade: Shades, color: Colors, count: Int, id: Int ) {
        self.shape = shape
        self.shade = shade
        self.color = color
        self.count = count
        self.id = id
    }

    
    
}
