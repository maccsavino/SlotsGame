//
//  SlotsGame.swift
//  Slots
//
//  Created by Kevin Savinovich on 4/6/23.
//

import Foundation

struct SlotsGame {
    private let numberOfCardsInANewGame = 3
    var cards: [SlotsCard] = []
    var score: Int? = 5
   
  
      init() {
          // Generate initial random cards
          for index in 0..<numberOfCardsInANewGame {
            let shape = SlotsCard.Shapes.all.randomElement()!
            let shade = SlotsCard.Shades.all.randomElement()!
            let color = SlotsCard.Colors.all.randomElement()!
            let card = SlotsCard(shape: shape, shade: shade, color: color, count: index, id: index)
              cards.append(card)
          }
      }
    
    mutating func spin() {
        
        guard let currentScore = score, currentScore >= 5 else {
            return
        }
        score! -= 5
        
        
        // Generate new random cards
        for index in 0..<cards.count {
            var card = cards[index]
            let newShape = SlotsCard.Shapes.all.randomElement()!
            let newShade = SlotsCard.Shades.all.randomElement()!
            let newColor = SlotsCard.Colors.all.randomElement()!
            card.shape = newShape
            card.shade = newShade
            card.color = newColor
            cards[index] = card
        }
        //game logic
            let shapes = Set(cards.map { $0.shape })
            let shades = Set(cards.map { $0.shade })
            let colors = Set(cards.map { $0.color })
            let numUniqueAttributes = [shapes.count, shades.count, colors.count]
            
            if numUniqueAttributes == [1, 1, 1] || numUniqueAttributes == [3, 3, 3] {
                score! += 4
            } else if numUniqueAttributes.filter({ $0 == 2 }).count == 2 {
                score! += 3
            } else if numUniqueAttributes.filter({ $0 == 1 || $0 == 3 }).count == 1 {
                score! += 1
            }
        
    }
    
    
    
        
}


extension SlotsGame{
    
    mutating func newgame(){
            score = 5
            // Generate new random cards
          for index in 0..<cards.count {
          var card = cards[index]
          let newShape = SlotsCard.Shapes.all.randomElement()!
          let newShade = SlotsCard.Shades.all.randomElement()!
          let newColor = SlotsCard.Colors.all.randomElement()!
          card.shape = newShape
          card.shade = newShade
          card.color = newColor
          cards[index] = card
            
            
      }
    }
    
    
}
