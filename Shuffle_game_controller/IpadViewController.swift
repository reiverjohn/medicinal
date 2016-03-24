//
//  IpadViewController.swift
//  Shuffle_game_controller
//
//  Created by cleisner on 12/15/15.
//  Copyright © 2015 cleisner. All rights reserved.
//

import UIKit

class IpadViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    var ipad_color = 0
    var score = 0
    var plants = [String]() // names of plant images 
    var answers = [String]()
    
    
override func viewDidLoad() {
        super.viewDidLoad()
    plants += ["cotton", "oats", "mint", "chamomile", "beet", "willow", "echinacea", "alfalfa", "madder", "calendula", "wheat", "flax", "lemon_balm", "eyeball_plant", "onion", "bedstraw", "gypsywort", "pumpkin", "sweet_pea", "st_johns_wort", "sunflower", "amaranth", "lavender", "aloe", "poppy", "buckwheat", "ramie", "red_clover", "fullers_teasel", "ginger"] // case sensitive name of plants images in assets folder
     answers += ["the jeans I wear", "the cereal, granola, or cookies I eat", "flavoring in my toothpaste", "the tea I drink to help me feel better", "food coloring", "medicine I take for a headache", "medicine I take for a cold", "food for cattle", "dying fabrics red", "dying fabrics yellow", "the bread I eat", "making linen sheets", "tea I drink and candy I eat", "treating toothaches", "practicing how to use a microscope", "the bed I sleep in", "dying fabrics black", "making a holiday pie", "making perfume", "treating depression", "making cooking oil", "dying fabrics red and as an edible grain", "making essential oils, perfumes and cosmetics", "treating a sunburng", "making medicine to treat pain", "making medicine for diabetes and for stuffing pillows", "making packing materials and fishing nets", "making medicine to lower cholesterol", "cleaning fabircs used in making clothes" ,"making medicine to treat an upset stomach"]
    button1.layer.borderWidth = 1
    button2.layer.borderWidth = 1
    button3.layer.borderWidth = 1
    
    button1.layer.borderColor = UIColor.lightGrayColor().CGColor
    button2.layer.borderColor = UIColor.lightGrayColor().CGColor
    button3.layer.borderColor = UIColor.lightGrayColor().CGColor
    
    }
    
    @IBAction func answerButtonPressed(sender: UIButton) {
        ipad_color = sender.tag
        self.performSegueWithIdentifier("segueToQuiz", sender: nil)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueToQuiz" {  //This here tells the Navigation Controller which segue to use.
            let QuizViewControllerSegue = segue.destinationViewController as! QuizViewController
            QuizViewControllerSegue.color = ipad_color  //This passes the value of the ipad color to the next View Controller
            QuizViewControllerSegue.score = score
            QuizViewControllerSegue.plants = plants
            QuizViewControllerSegue.answers = answers
        }
    }
    
    
}