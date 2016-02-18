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
    private var _attackPwr : Int = 10
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
    
    var attackPwr : Int {
        get{
            return _attackPwr
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
    
    init(type : characterType, side: playerSide, startingHp: Int, attackPwr: Int){
        _hp = startingHp
        _attackPwr = attackPwr
        _side = side
        _type = type
    }
    
    func attemptAttack(attackPwr: Int) -> Bool {
        self._hp -= attackPwr
        
        return true
    }
    
}
