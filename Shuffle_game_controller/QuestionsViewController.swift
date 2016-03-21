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
    
    var plants = [String]()
    //var color = 0
    var answers = [String]()
    var randomPlant = Int() // this is the random number that shows which plant to show
    var numQuestions = 0 // this the how many questions the player is asked
    var score = 0 //this is how many questions the player has answered correctly
    var donePlants = [Int:String]() // this keeps track of which plants have already been shown
    var ranIndex1 = Int()
    var ranIndex2 = Int()
    
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
        
        // MOD
        rightanswer.text = answers[array]   // This is the answer corresponding to the selected plant
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
        return
    }
    
    

    func gotoEnding(action: UIAlertAction! = nil) {
        self.performSegueWithIdentifier("segueToScoreViewController", sender: nil)  //This function can be called to start the segue to the score page
    }
    
    
    
    /*
    @IBAction func answerButtonPressed(sender: UIButton) {
        ++numQuestions
        if numQuestions == 10
        {
            if sender.tag == 0 { //hits answer 1
                if answers[randomPlant] 
            }
        }
}
    
    
    
   @IBAction func answerButtonPressed(sender: UIButton) {  //all of this needs to happens when you press the QR code scanner *********
        ++numQuestions  //This keeps track of how many questions you have asked
        
        if numQuestions == 10 {  //Once you reach the right number, do the stuff here
            
            if sender.tag == answers[randomPlant] {
                let ac = UIAlertController(title: "Result", message: "Congratulations, you are correct!", preferredStyle: .Alert)  //This gives a popup like up above
                ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: gotoEnding)) //but see here the handler is different, so when they press "ok" it triggers the segue
                presentViewController(ac, animated: true, completion: nil)
            }
            else {
                let ac = UIAlertController(title: "Result", message: "Sorry, that's incorrect.", preferredStyle: .Alert)
                ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: gotoEnding))
                presentViewController(ac, animated: true, completion: nil)
            }
        }
        
        if sender.tag == answers[randomPlant] {  //this is the same as the one above, except that it doesn't trigger the segue
            ++score
            let ac = UIAlertController(title: "Result", message: "Congratulations, you are correct!", preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: askQuestion)) //here, instead of triggering the segue, it calls the askQuestion function, which resets all this and chooses a new plant
            presentViewController(ac, animated: true, completion: nil)
        }
        if sender.tag != answers[randomPlant] {
            let ac = UIAlertController(title: "Result", message: "Sorry, that's incorrect.", preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: askQuestion))
            presentViewController(ac, animated: true, completion: nil)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "segueToScoreViewController" {  //This here tells the Navigation Controller which segue to use.
            let scoreViewControllerSegue = segue.destinationViewController as! ScoreViewController
            scoreViewControllerSegue.score = score  //This passes the value of the variable score to the variable score in the next View Controller
            scoreViewControllerSegue.numQuestions = numQuestions   //This does the same for numQuestions
            
            
        }
    }
*/
}