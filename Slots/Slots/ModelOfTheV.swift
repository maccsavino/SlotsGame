//
//  SlotsViewModel.swift
//  Slots
//
//  Created by Kevin Savinovich on 4/14/23.
//

import Foundation

class ModelOfTheView: ObservableObject{
    
    @Published var gamemodel = SlotsGame()
    
    var score: Int {
        gamemodel.score! 
    }
    
    var cards: [SlotsCard] {
        gamemodel.cards
    }
    
    func newGameIntent() {
           gamemodel.newgame()
       }
    
    func spinIntent() {
           gamemodel.spin()
       }
   
    
    
  
    }
    

