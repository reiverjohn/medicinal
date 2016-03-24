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
    var color = Int()
    var answers = [String]()
    var randomPlant = Int() // this is the random number that shows which plant to show
    var ranIndex1 = Int()
    var ranIndex2 = Int()
    var donePlants: Set<String> = []
    var answerPosition = Int()
    
    @IBAction func buttonTapped(sender: UIButton) {
        
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score += 0
        }
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: askQuestion))
        presentViewController(ac, animated: true, completion: nil)
        
    }
    
    
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    // MOD FOR DEVEL
    var rightanswer = String()
    
    @IBOutlet weak var ranAnswer1: UILabel!
    @IBOutlet weak var ranAnswer2: UILabel!
    @IBOutlet weak var ranAnswer3: UILabel!
    
     override func viewDidLoad() {
        super.viewDidLoad()
                
        askQuestion(nil)
        
    }
    

    
    
      func askQuestion(action: UIAlertAction!) {
        print(donePlants.count)
        
        // MOD
        rightanswer = answers[array]   // This is the answer corresponding to the selected plant
        ranIndex1 = Int(arc4random_uniform(UInt32(answers.count))    )      // Generate the first random incorrect answer
        while ranIndex1 == array {
            ranIndex1 = Int(arc4random_uniform(UInt32(answers.count))    )     // This makes sure I don't repeat a question choice
        }
        ranIndex2 = Int(arc4random_uniform(UInt32(answers.count))    )           // Generate the second random incorrect answer
        while (ranIndex2 == ranIndex1) || (ranIndex2 == array) {
                ranIndex2 = Int(arc4random_uniform(UInt32(answers.count))    )   // This makes sure I don't repeat a question choice
            }
        //answerPosition = GKRandomSource.sharedRandom().nextIntWithUpperBound(2)
        answerPosition = Int(arc4random_uniform(3))
        if answerPosition == 0 {
            ranAnswer1.text = rightanswer
            correctAnswer = 0
            ranAnswer2.text = answers[ranIndex1]
            ranAnswer3.text = answers[ranIndex2]
            
        }
        else if answerPosition == 1 {
            ranAnswer2.text = rightanswer
            correctAnswer = 1
            ranAnswer1.text = answers[ranIndex1]
            ranAnswer3.text = answers[ranIndex2]
        }
        else {
            ranAnswer3.text = rightanswer
            correctAnswer = 2
            ranAnswer1.text = answers[ranIndex1]
            ranAnswer2.text = answers[ranIndex2]
            
        }
       
        self.performSegueWithIdentifier("SequeToQuiz", sender: nil)
        return
    }
    
    // override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SequeToQuiz" {  //This here tells the Navigation Controller which segue to use.
            let QuizViewControllerSegue = segue.destinationViewController as! QuizViewController
            QuizViewControllerSegue.donePlants = donePlants
            QuizViewControllerSegue.score = score
            QuizViewControllerSegue.plants = plants
            QuizViewControllerSegue.answers = answers
            QuizViewControllerSegue.color = color
        }
    }
    

    func gotoEnding(action: UIAlertAction! = nil) {
        self.performSegueWithIdentifier("segueToScoreViewController", sender: nil)  //This function can be called to start the segue to the score page
    }
    
    
    
   
}