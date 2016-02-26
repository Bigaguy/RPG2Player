//
//  Character.swift
//  RPG2Player
//
//  Created by Andrew Ingram on 2016-02-17.
//  Copyright © 2016 Sabring. All rights reserved.
//

import Foundation

class Character {
    
    private var _hp : Int = 100
    private var _side : playerSide!
    private var _type : characterType!
    
    enum playerSide {
        case left
        case right
    }
    
    enum characterType {
        case golem
        case knight
    }
    
    var side : playerSide {
        get{
            return _side
        }
    }
    
    var type : characterType {
        get{
            return _type
        }
    }
    
    var hp : Int {
        get{
            return _hp
        }
    }
    
    var isAlive : Bool {
        get{
            if hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    init(type : characterType, side: playerSide, startingHp: Int){
        _hp = startingHp
        _side = side
        _type = type
    }
    
    func attemptAttack() -> Int {
        var randomNumber : Int!
        randomNumber = Int(1+arc4random_uniform(40))
        self._hp -= randomNumber
        
        return randomNumber
    }
    
}
