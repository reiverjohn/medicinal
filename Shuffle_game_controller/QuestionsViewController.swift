//
//  QuestionsViewController.swift
//  Shuffle_game_controller
//
//  Created by cleisner on 12/15/15.
//  Copyright © 2015 cleisner. All rights reserved.
//

import UIKit
import GameplayKit

class QuestionsViewController: UIViewController {
    
    // MOD
    var array = Int()
    
    var score = Int()
    var correctAnswer = Int()
    
    var plants = [String]()
    //var color = 0
    var answers = [String]()
    var randomPlant = Int() // this is the random number that shows which plant to show
    var ranIndex1 = Int()
    var ranIndex2 = Int()
    var donePlants: Set<String> = []
    
    @IBAction func buttonTapped(sender: UIButton) {
        
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: askQuestion))
        presentViewController(ac, animated: true, completion: nil)
        
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
                
        askQuestion(nil)
        
    }
    

    
    
    //func askQuestion(action: UIAlertAction! = nil) {
      func askQuestion(action: UIAlertAction!) {
        print(donePlants.count)

        
        // MOD
        rightanswer.text = answers[array]   // This is the answer corresponding to the selected plant
        correctAnswer = 0
        ranIndex1 = GKRandomSource.sharedRandom().nextIntWithUpperBound(answers.count)          // Generate the first random incorrect answer
        while ranIndex1 == array {
            ranIndex1 = GKRandomSource.sharedRandom().nextIntWithUpperBound(answers.count)      // This makes sure I don't repeat a question choice
        }
        ranIndex2 = GKRandomSource.sharedRandom().nextIntWithUpperBound(answers.count)            // Generate the second random incorrect answer
        while (ranIndex1 == ranIndex2) && (ranIndex2 != array) {
                ranIndex2 = GKRandomSource.sharedRandom().nextIntWithUpperBound(answers.count)    // This makes sure I don't repeat a question choice
            }
        ranAnswer1.text = answers[ranIndex1]
        ranAnswer2.text = answers[ranIndex2]
        self.performSegueWithIdentifier("SequeToQuiz", sender: nil)
        return
    }
    
    // override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SequeToQuiz" {  //This here tells the Navigation Controller which segue to use.
            let QuizViewControllerSegue = segue.destinationViewController as! QuizViewController
            QuizViewControllerSegue.donePlants = donePlants
        }
    }
    

    func gotoEnding(action: UIAlertAction! = nil) {
        self.performSegueWithIdentifier("segueToScoreViewController", sender: nil)  //This function can be called to start the segue to the score page
    }
    
    
    
   
}