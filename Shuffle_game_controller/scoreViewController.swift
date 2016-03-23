//
//  scoreViewController.swift
//  Shuffle_game_controller
//
//  Created by cleisner on 12/15/15.
//  Copyright © 2015 cleisner. All rights reserved.
//

import UIKit
import GameplayKit

class scoreViewController: UIViewController {
    
    // MOD
    var array = Int()
    
    var plants = [String]()
    //var color = 0
    var answers = [String]()
    var randomPlant = Int() // this is the random number that shows which plant to show
    var numQuestions = 0 // this the how many questions the player is asked
    var score = 0 //this is how many questions the player has answered correctly
    //var donePlants = [Int:String]() // this keeps track of which plants have already been shown
    var ranIndex1 = Int()
    var ranIndex2 = Int()
    var donePlants: Set<String> = []
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue){
        
    }
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    // MOD FOR DEVEL
    @IBOutlet weak var rightanswer: UILabel!
    @IBOutlet weak var ranAnswer1: UILabel!
    @IBOutlet weak var ranAnswer2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        plants += ["cotton", "oats", "mint", "chamomile", "beet", "willow", "echinacea", "alfalfa", "madder", "calendula", "wheat", "flax", "lemon_balm", "eyeball_plant", "onion", "bedstraw", "gypsywort", "pumpkin", "sweet_pea", "st_johns_wort", "sunflower", "amaranth", "lavender", "aloe", "poppy", "buckwheat", "ramie", "red_clover", "fullers_teasel", "ginger"]
        answers += ["the jeans I wear", "the cereal, granola, or cookies I eat", "flavoring in my toothpaste", "the tea I drink to help me feel better", "food coloring", "medicine I take for a headache", "medicine I take for a cold", "food for cattle", "dying fabrics red", "dying fabrics yellow", "the bread I eat", "making linen sheets", "tea I drink and candy I eat", "treating toothaches", "practicing how to use a microscope", "the bed I sleep in", "dying fabrics black", "making a holiday pie", "making perfume", "treating depression", "making cooking oil", "dying fabrics red and as an edible grain", "making essential oils, perfumes and cosmetics", "treating a sunburng", "making medicine to treat pain", "making medicine for diabetes and for stuffing pillows", "making packing materials and fishing nets", "making medicine to lower cholesterol", "cleaning fabircs used in making clothes" ,"making medicine to treat an upset stomach"]
        
        
        askQuestion()
        
    }
    
    
    
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        
        
        return
    }
    
    
    
    func gotoEnding(action: UIAlertAction! = nil) {
        self.performSegueWithIdentifier("segueToScoreViewController", sender: nil)  //This function can be called to start the segue to the score page
    }
    
    
    
    
}