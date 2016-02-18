//
//  GameController.swift
//  RPG2Player
//
//  Created by Andrew Ingram on 2016-02-17.
//  Copyright © 2016 Sabring. All rights reserved.
//

import Foundation
import UIKit

class GameController : NSObject{
    
    var vc: ViewController!
    var leftPlayer: Character?
    var rightPlayer: Character?
    var leftPlayerSelect = true
    var rightPlayerSelect = false
    
    init(vc: ViewController) {
        self.vc = vc
    }
    
    func changeScreenElements() {
        vc.leftAttackButton.hidden = false
        vc.rightAttackButton.hidden = false
        vc.leftHpLabel.hidden = false
        vc.rightHpLabel.hidden = false
        vc.rightLabel.hidden = false
        vc.leftLabel.hidden = false
        vc.rightPlayerSelectButton.hidden = true
        vc.leftPlayerSelectButton.hidden = true
        vc.rightSelectLabel.hidden = true
        vc.leftSelectLabel.hidden = true
    }
    
    func setupCharacter(character: Character) {
        
        changeScreenElements()
        
        if character.side == Character.playerSide.left {
            
            if character.type == Character.characterType.knight {
                
                
            } else {
                
                
            }
            
        } else {
            
            if character.type == Character.characterType.knight {
                
                
            } else {
                
                
            }
            
        
        }
    }
    
    func knightChosen() {
        
        if leftPlayerSelect {
            leftPlayer = Character(type: Character.characterType.knight, side: Character.playerSide.left, startingHp: 500, attackPwr: 20)
            rightPlayerSelect = true
            leftPlayerSelect = false
            vc.bottomLabel.text = "Player 2 choose your character"
            
        } else {
            rightPlayer = Character(type: Character.characterType.knight, side: Character.playerSide.right, startingHp: 500, attackPwr: 20)
            vc.bottomLabel.text = "Fight!"
            rightPlayerSelect = false
            
            if !rightPlayerSelect && !leftPlayerSelect{
                
                setupCharacter(leftPlayer!)
                setupCharacter(rightPlayer!)
                
            }
            
        }
        
        
    }
    
    func golemChosen() {
        if leftPlayerSelect {
            leftPlayer = Character(type: Character.characterType.golem, side: Character.playerSide.left, startingHp: 1000, attackPwr: 10)
            rightPlayerSelect = true
            leftPlayerSelect = false
            vc.bottomLabel.text = "Player 2 choose your character"
            
        } else {
            rightPlayer = Character(type: Character.characterType.golem, side: Character.playerSide.right, startingHp: 1000, attackPwr: 10)
            vc.bottomLabel.text = "Fight!"
            rightPlayerSelect = false
            
            if !rightPlayerSelect && !leftPlayerSelect{
                
                setupCharacter(leftPlayer!)
                setupCharacter(rightPlayer!)
                
            }
            
            
        }
        

        
    }
    
}
