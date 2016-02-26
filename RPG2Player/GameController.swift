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
    var player1First = false
    var player2First = false
    var attackPower : Int!
    
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
    
    func updatePlayerOneHp() {
        vc.leftHpLabel.text = "\(leftPlayer!.hp) HP"
        
    }
    
    func updatePlayerTwoHp() {
        vc.rightHpLabel.text = "\(rightPlayer!.hp) HP"
        
    }
    
    func whoAttacksFirst() {
        if player1First {
            vc.bottomLabel.text = "Player 1 attacks first!"
        } else if player2First {
            vc.bottomLabel.text = "Player 2 attacks first!"
        }
        
    }
    
    
    func setupCharacter(character: Character) {
        
        changeScreenElements()
        
        if character.side == Character.playerSide.left {
            
            if character.type == Character.characterType.knight {
                
                vc.leftImage.image = UIImage(named:"player")
                vc.leftImage.transform = CGAffineTransformMakeScale(-1, 1)
                
            } else {
                vc.leftImage.image = UIImage(named:"enemy")
                
            }
            
        } else {
            
            if character.type == Character.characterType.knight {
                vc.rightImage.image = UIImage(named:"player")
                
            } else {
                vc.rightImage.image = UIImage(named:"enemy")
                vc.rightImage.transform = CGAffineTransformMakeScale(-1, 1)
                
            }
            
        
        }
    }
    
    func knightChosen() {
        
        if leftPlayerSelect {
            leftPlayer = Character(type: Character.characterType.knight, side: Character.playerSide.left, startingHp: 200)
            rightPlayerSelect = true
            leftPlayerSelect = false
            vc.bottomLabel.text = "Player 2 choose your character"
            
        } else {
            rightPlayer = Character(type: Character.characterType.knight, side: Character.playerSide.right, startingHp: 200)
            vc.bottomLabel.text = "Fight!"
            rightPlayerSelect = false
            
            if !rightPlayerSelect && !leftPlayerSelect{
                
                setupCharacter(leftPlayer!)
                setupCharacter(rightPlayer!)
                updatePlayerTwoHp()
                updatePlayerOneHp()
                whoAttacksFirst()
                
                
                
            }
            
        }
        
        
    }
    
    func golemChosen() {
        if leftPlayerSelect {
            leftPlayer = Character(type: Character.characterType.golem, side: Character.playerSide.left, startingHp: 200)
            rightPlayerSelect = true
            leftPlayerSelect = false
            vc.bottomLabel.text = "Player 2 choose your character"
            
        } else {
            rightPlayer = Character(type: Character.characterType.golem, side: Character.playerSide.right, startingHp: 200)
            vc.bottomLabel.text = "Fight!"
            rightPlayerSelect = false
            
            if !rightPlayerSelect && !leftPlayerSelect{
                
                setupCharacter(leftPlayer!)
                setupCharacter(rightPlayer!)
                updatePlayerOneHp()
                updatePlayerTwoHp()
                whoAttacksFirst()
                
            }
            
            
        }
    }
    
    
    func checkGameStatus() {
        if leftPlayer!.hp <= 0 {
            vc.bottomLabel.text = "Player 2 wins!"
            vc.restartButton.hidden = false
            vc.restartLabel.hidden = false
            vc.leftAttackButton.hidden = true
            vc.rightAttackButton.hidden = true
            vc.leftHpLabel.hidden = true
            vc.rightHpLabel.hidden = true
            vc.rightLabel.hidden = true
            vc.leftLabel.hidden = true
        } else if  rightPlayer!.hp <= 0 {
            vc.bottomLabel.text = "Player 1 wins!"
            vc.restartButton.hidden = false
            vc.restartLabel.hidden = false
            vc.leftAttackButton.hidden = true
            vc.rightAttackButton.hidden = true
            vc.leftHpLabel.hidden = true
            vc.rightHpLabel.hidden = true
            vc.rightLabel.hidden = true
            vc.leftLabel.hidden = true
        }
    }
    
    func playerOneAttack() {
        let attackPower = rightPlayer!.attemptAttack()
        vc.bottomLabel.text = "Attacked player 2 for \(attackPower) HP"
        updatePlayerTwoHp()
        vc.leftAttackButton.enabled = false
        vc.rightAttackButton.enabled = true
            
        }
        
    
    
    func playerTwoAttack() {
        let attackPower = leftPlayer!.attemptAttack()
        vc.bottomLabel.text = "Attacked player 1 for \(attackPower) HP"
        updatePlayerOneHp()
        vc.rightAttackButton.enabled = false
        vc.leftAttackButton.enabled = true
            
        }

    
    
    func playerOneAttackFirst() -> Bool {
        let number = Int(arc4random_uniform(2))
        
        switch number {
        case 0: return true
        case 1: return false
        default: return true
            
        }
    }
    
    func restart() {
        vc.rightPlayerSelectButton.hidden = false
        vc.leftPlayerSelectButton.hidden = false
        vc.rightSelectLabel.hidden = false
        vc.leftSelectLabel.hidden = false
        vc.restartButton.hidden = true
        vc.restartLabel.hidden = true
        vc.rightImage.image = UIImage(named: "player")
        vc.rightImage.transform = CGAffineTransformMakeScale(1, 1)
        vc.leftImage.image = UIImage(named: "enemy")
        vc.leftImage.transform = CGAffineTransformMakeScale(1, 1)
        vc.bottomLabel.text = "Player 1 choose your character"
        vc.viewDidLoad()
        
    }
}
