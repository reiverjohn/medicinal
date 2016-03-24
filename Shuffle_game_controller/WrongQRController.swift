//
//  WrongQRController.swift
//  Shuffle_game_controller
//
//  Created by cleisner on 12/15/15.
//  Copyright © 2015 cleisner. All rights reserved.
//

import UIKit
import GameplayKit

class WrongQRController: UIViewController {
    
    // MOD
    var array = Int()
    
    var plants = [String]()
    //var color = 0
    var answers = [String]()
    var randomPlant = Int() // this is the random number that shows which plant to show
    var numQuestions = 0 // this the how many questions the player is asked
    var ranIndex1 = Int()
    var ranIndex2 = Int()
    var donePlants: Set<String> = []
    var score = Int()

    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    // MOD FOR DEVEL
    @IBOutlet weak var myplant: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        plants += ["cotton", "oats", "mint", "chamomile", "beet", "willow", "echinacea", "alfalfa", "madder", "calendula", "wheat", "flax", "lemon_balm", "eyeball_plant", "onion", "bedstraw", "gypsywort", "pumpkin", "sweet_pea", "st_johns_wort", "sunflower", "amaranth", "lavender", "aloe", "poppy", "buckwheat", "ramie", "red_clover", "fullers_teasel", "ginger"]
        answers += ["the jeans I wear", "the cereal, granola, or cookies I eat", "flavoring in my toothpaste", "the tea I drink to help me feel better", "food coloring", "medicine I take for a headache", "medicine I take for a cold", "food for cattle", "dying fabrics red", "dying fabrics yellow", "the bread I eat", "making linen sheets", "tea I drink and candy I eat", "treating toothaches", "practicing how to use a microscope", "the bed I sleep in", "dying fabrics black", "making a holiday pie", "making perfume", "treating depression", "making cooking oil", "dying fabrics red and as an edible grain", "making essential oils, perfumes and cosmetics", "treating a sunburng", "making medicine to treat pain", "making medicine for diabetes and for stuffing pillows", "making packing materials and fishing nets", "making medicine to lower cholesterol", "cleaning fabircs used in making clothes" ,"making medicine to treat an upset stomach"]
        
        // MOD FOR DEVEL
        myplant.layer.borderWidth = 1
        
        
        askQuestion() // this does the main work of the script
    }
    
    @IBAction func answerButtonPressed(sender: UIButton) {
        self.performSegueWithIdentifier("segueToQRScanner", sender: nil)
    }
    // override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueToQRScanner" {  //This here tells the Navigation Controller which segue to use.
            let QRViewControllerSegue = segue.destinationViewController as! QRViewController
            QRViewControllerSegue.array =  array  //This passes the value of the plant to the next View Controller
            QRViewControllerSegue.donePlants = donePlants
            QRViewControllerSegue.score = score
        }
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        // MOD FOR DEVEL
        myplant.text = plants[array]
        return
    }
    
    
    
    
}