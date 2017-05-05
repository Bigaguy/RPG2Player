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
        vc.leftAttackButton.isHidden = false
        vc.rightAttackButton.isHidden = false
        vc.leftHpLabel.isHidden = false
        vc.rightHpLabel.isHidden = false
        vc.rightLabel.isHidden = false
        vc.leftLabel.isHidden = false
        vc.rightPlayerSelectButton.isHidden = true
        vc.leftPlayerSelectButton.isHidden = true
        vc.rightSelectLabel.isHidden = true
        vc.leftSelectLabel.isHidden = true
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
    
    
    func setupCharacter(_ character: Character) {
        
        changeScreenElements()
        
        if character.side == Character.playerSide.left {
            
            if character.type == Character.characterType.knight {
                
                vc.leftImage.image = UIImage(named:"player")
                vc.leftImage.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else {
                vc.leftImage.image = UIImage(named:"enemy")
                
            }
            
        } else {
            
            if character.type == Character.characterType.knight {
                vc.rightImage.image = UIImage(named:"player")
                
            } else {
                vc.rightImage.image = UIImage(named:"enemy")
                vc.rightImage.transform = CGAffineTransform(scaleX: -1, y: 1)
                
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
            vc.restartButton.isHidden = false
            vc.restartLabel.isHidden = false
            vc.leftAttackButton.isHidden = true
            vc.rightAttackButton.isHidden = true
            vc.leftHpLabel.isHidden = true
            vc.rightHpLabel.isHidden = true
            vc.rightLabel.isHidden = true
            vc.leftLabel.isHidden = true
        } else if  rightPlayer!.hp <= 0 {
            vc.bottomLabel.text = "Player 1 wins!"
            vc.restartButton.isHidden = false
            vc.restartLabel.isHidden = false
            vc.leftAttackButton.isHidden = true
            vc.rightAttackButton.isHidden = true
            vc.leftHpLabel.isHidden = true
            vc.rightHpLabel.isHidden = true
            vc.rightLabel.isHidden = true
            vc.leftLabel.isHidden = true
        }
    }
    
    func playerOneAttack() {
        let attackPower = rightPlayer!.attemptAttack()
        vc.bottomLabel.text = "Attacked player 2 for \(attackPower) HP"
        updatePlayerTwoHp()
        vc.leftAttackButton.isEnabled = false
        vc.rightAttackButton.isEnabled = true
            
        }
        
    
    
    func playerTwoAttack() {
        let attackPower = leftPlayer!.attemptAttack()
        vc.bottomLabel.text = "Attacked player 1 for \(attackPower) HP"
        updatePlayerOneHp()
        vc.rightAttackButton.isEnabled = false
        vc.leftAttackButton.isEnabled = true
            
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
        vc.rightPlayerSelectButton.isHidden = false
        vc.leftPlayerSelectButton.isHidden = false
        vc.rightSelectLabel.isHidden = false
        vc.leftSelectLabel.isHidden = false
        vc.restartButton.isHidden = true
        vc.restartLabel.isHidden = true
        vc.rightImage.image = UIImage(named: "player")
        vc.rightImage.transform = CGAffineTransform(scaleX: 1, y: 1)
        vc.leftImage.image = UIImage(named: "enemy")
        vc.leftImage.transform = CGAffineTransform(scaleX: 1, y: 1)
        vc.bottomLabel.text = "Player 1 choose your character"
        vc.viewDidLoad()
        
    }
}
