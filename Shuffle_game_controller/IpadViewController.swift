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
    
override func viewDidLoad() {
        super.viewDidLoad()
    
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
        }
    }
    
    
}