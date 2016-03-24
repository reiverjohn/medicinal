//
//  QuizViewController.swift
//  Shuffle_game_controller
//
//  Created by cleisner on 12/15/15.
//  Copyright © 2015 cleisner. All rights reserved.
//

import UIKit
import GameplayKit


class CompleteViewController: UIViewController {
    
    // MOD
    var array:Int!
    var plants = [String]()
    var answers = [String]()
    var randomPlant = Int() // this is the random number that shows which plant to show
    //var doneList = [Int:String]()
    var donePlants: Set<String> = []
    var score = Int()


    @IBOutlet weak var myScore: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myScore.text = String(score)
        myScore.layer.borderWidth = 0
    }

}