//
//  QuizViewController.swift
//  Shuffle_game_controller
//
//  Created by cleisner on 12/15/15.
//  Copyright © 2015 cleisner. All rights reserved.
//

import UIKit
import GameplayKit


class QuizViewController: UIViewController {
    
    @IBOutlet weak var Image1: UIImageView!
    @IBOutlet weak var Image2: UIImageView!
    @IBOutlet weak var Image3: UIImageView!
    @IBOutlet weak var qrbutton: UIButton!
    
    var color = 0
    var lower = 0
    var upper = 0
    var current = 0
    
    // MOD FOR DEVEL
    @IBOutlet weak var myplant: UITextView!
    
    var plants = [String]() // names of plant images
    var randomPlant = Int() // this is the random number that shows which plant to show
    //var donePlants = [Int:String]() // this keeps track of which plants have already been shown
    var donePlants: Set<String> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true // Hide the back button so players can't go back
        plants += ["cotton", "oats", "mint", "chamomile", "beet", "willow", "echinacea", "alfalfa", "madder", "calendula", "wheat", "flax", "lemon_balm", "eyeball_plant", "onion", "bedstraw", "gypsywort", "pumpkin", "sweet_pea", "st_johns_wort", "sunflower", "amaranth", "lavender", "aloe", "poppy", "buckwheat", "ramie", "red_clover", "fullers_teasel", "ginger"] // case sensitive name of plants images in assess folder
        
        Image1.layer.borderWidth = 1 //these lines give the image boxes a nice border and frame so they are easier to see
        Image2.layer.borderWidth = 1
        Image3.layer.borderWidth = 1
        
        Image1.layer.borderColor = UIColor.lightGrayColor().CGColor
        Image2.layer.borderColor = UIColor.lightGrayColor().CGColor
        Image3.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        // MOD FOR DEVEL
        myplant.layer.borderWidth = 1
       
        
        askQuestion() // this does the main work of the script
        
    }
    
    //inout plants: Int, inout _ arraytwo: Int
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        if color == 0 { //blue ipad ***make sure button tags are 1, 2 and 3 for blue, black, pink
            randomPlant = GKRandomSource.sharedRandom().nextIntWithUpperBound(10) // will generate a number between 0-10
            
            while donePlants.contains(plants[randomPlant]) { //this is not efficient, but it makes sure I don't repeat a plant
                randomPlant = GKRandomSource.sharedRandom().nextIntWithUpperBound(10)  //This makes sure I don't repeat a question
            }
        }
        if color == 1 {
            randomPlant = GKRandomSource.sharedRandom().nextIntWithUpperBound(10) + 10// will generate a number between 11-20
            while donePlants.contains(plants[randomPlant]) {
            //while donePlants[randomPlant] == "DONE" { //this is not efficient, but it makes sure I don't repeat a plant
                randomPlant = GKRandomSource.sharedRandom().nextIntWithUpperBound(10) + 10  //This makes sure I don't repeat a question
            }
        }
        if color == 2 {
            randomPlant = GKRandomSource.sharedRandom().nextIntWithUpperBound(10) + 20 // will generate a number between 21-30
            
            while donePlants.contains(plants[randomPlant]) {
                randomPlant = GKRandomSource.sharedRandom().nextIntWithUpperBound(10) + 20 //This makes sure I don't repeat a question
            }
        }
        
        donePlants.insert(plants[randomPlant])  //Once a plant is used, mark it as so in the hash
        Image1.image = UIImage(named: plants[randomPlant])  //This makes the center image start up
        var secondimagefile = plants[randomPlant]
        secondimagefile += "_2" //add the "_2" to the end of the file
        Image2.image = UIImage(named: secondimagefile)
        var thirdimagefile = plants[randomPlant]
        thirdimagefile += "_3" //add the "_3" to the end of the file
        Image3.image = UIImage(named: thirdimagefile)
        
       // MOD FOR DEVEL
        myplant.text = plants[randomPlant]
    }
    

    @IBAction func answerButtonPressed(sender: UIButton) {
        self.performSegueWithIdentifier("segueToQRScanner", sender: nil)
    }
        // override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueToQRScanner" {  //This here tells the Navigation Controller which segue to use.
            let QRViewControllerSegue = segue.destinationViewController as! QRViewController
            QRViewControllerSegue.array = randomPlant  //This passes the value of the plant to the next View Controller
            QRViewControllerSegue.donePlants = donePlants

        }
    }

}