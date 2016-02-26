//
//  ViewController.swift
//  RPG2Player
//
//  Created by Andrew Ingram on 2016-02-17.
//  Copyright © 2016 Sabring. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var gc: GameController!

    @IBOutlet weak var leftAttackButton: UIButton!
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightAttackButton: UIButton!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var leftHpLabel: UILabel!
    @IBOutlet weak var rightHpLabel: UILabel!
    @IBOutlet weak var leftPlayerSelectButton: UIButton!
    @IBOutlet weak var rightPlayerSelectButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var restartLabel: UILabel!
    @IBOutlet weak var rightSelectLabel: UILabel!
    @IBOutlet weak var leftSelectLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gc = GameController(vc: self)
        
        if gc.playerOneAttackFirst() {
            leftAttackButton.enabled = true
            rightAttackButton.enabled = false
            gc.player1First = true
        } else {
            leftAttackButton.enabled = false
            rightAttackButton.enabled = true
            gc.player2First = true
        }
        
    }

    @IBAction func leftAttackPressed(sender: AnyObject) {
        gc.playerOneAttack()
        gc.checkGameStatus()
        
    }

    @IBAction func rightAttackPressed(sender: AnyObject) {
        gc.playerTwoAttack()
        gc.checkGameStatus()
        
    }

    @IBAction func leftSelectPressed(sender: AnyObject) {
    
        gc.golemChosen()
        
    }
    
    @IBAction func rightSelectPressed(sender: AnyObject) {
        
        gc.knightChosen()

    }
    
    @IBAction func restartPressed(sender: AnyObject) {
        gc.restart()
        
    }
}

