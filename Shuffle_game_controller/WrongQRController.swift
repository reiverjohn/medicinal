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
    var color = Int()
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
            QRViewControllerSegue.plants = plants
            QRViewControllerSegue.answers = answers
            QRViewControllerSegue.color = color
        }
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        // MOD FOR DEVEL
        myplant.text = plants[array]
        return
    }
    
    
    
    
}