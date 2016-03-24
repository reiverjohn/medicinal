//
//  QRViewController.swift
//  Shuffle_game_controller
//
//  Created by cleisner on 12/15/15.
//  Copyright © 2015 cleisner. All rights reserved.
//

//
//  ViewController.swift
//  QRCodeReaderDemo
//
//  Created by TheAppGuruz-iOS-103 on 19/01/15.
//  Copyright (c) 2015 TheAppGururz. All rights reserved.
//

import UIKit
import AVFoundation


class QRViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate
{
    
    @IBOutlet weak var lblQRCodeResult: UILabel!
    @IBOutlet weak var lblQRCodeLabel: UILabel!
    
    var array:Int!
    var objCaptureSession:AVCaptureSession?
    var objCaptureVideoPreviewLayer:AVCaptureVideoPreviewLayer?
    var vwQRCode:UIView?
    var score = Int()
    var color = Int()
    
    // MOD
    var plants = [String]()
    var answers = [String]()
    var randomPlant = Int() // this is the random number that shows which plant to show
    //var doneList = [Int:String]()
    var donePlants: Set<String> = []
    

     override func  viewDidLoad() {
        super.viewDidLoad()
        self.configureVideoCapture()
        self.addVideoPreviewLayer()
        self.initializeQRView()
        
        randomPlant = array
    }
    
    // SEGUE MOD
    // override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "trueTrans" {  //This here tells the Navigation Controller which segue to use.
            let QuestionsViewControllerSegue = segue.destinationViewController as! QuestionsViewController
            QuestionsViewControllerSegue.array = randomPlant  //This passes the value of the plant to the next View Controller
            QuestionsViewControllerSegue.donePlants = donePlants
            QuestionsViewControllerSegue.score = score
            QuestionsViewControllerSegue.plants = plants
            QuestionsViewControllerSegue.answers = answers
            QuestionsViewControllerSegue.color = color
            
        }
        if segue.identifier == "falseTrans" {
            let WrongQRControllerSegue = segue.destinationViewController as! WrongQRController
            WrongQRControllerSegue.array = randomPlant  //This passes the value of the plant to the next View Controller
            WrongQRControllerSegue.donePlants = donePlants
            WrongQRControllerSegue.score = score
            WrongQRControllerSegue.plants = plants
            WrongQRControllerSegue.answers = answers
            WrongQRControllerSegue.color = color
        }
    }
    // END SEGUE MOD
    
    
    
    func configureVideoCapture() {
        let objCaptureDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        var error:NSError?
        let objCaptureDeviceInput: AnyObject!
        do {
            objCaptureDeviceInput = try AVCaptureDeviceInput(device: objCaptureDevice) as AVCaptureDeviceInput
            
        } catch let error1 as NSError {
            error = error1
            objCaptureDeviceInput = nil
        }
        
        if (error != nil) {
            //let alertView:UIAlertView = UIAlertView(title: "Device Error", message:"Device not Supported for this Application", delegate: nil, cancelButtonTitle: "Ok Done")
            let alertView = UIAlertController(title: "Device Error", message:"Device not Supported for this Application", preferredStyle: .Alert)
            //alertView.show()
            let yesAction = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in }
            let noAction = UIAlertAction(title: "Cancel", style: .Default) { (action) -> Void in }
            alertView.addAction(yesAction)
            alertView.addAction(noAction)
            self.presentViewController(alertView, animated: true, completion: nil)
            
            return
        }

        objCaptureSession = AVCaptureSession()
        objCaptureSession?.addInput(objCaptureDeviceInput as! AVCaptureInput)
        let objCaptureMetadataOutput = AVCaptureMetadataOutput()
        objCaptureSession?.addOutput(objCaptureMetadataOutput)
        objCaptureMetadataOutput.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
        objCaptureMetadataOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
        
    }
    
    func addVideoPreviewLayer() {
        objCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session: objCaptureSession)
        objCaptureVideoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
        objCaptureVideoPreviewLayer?.frame = view.layer.bounds
        self.view.layer.addSublayer(objCaptureVideoPreviewLayer!)
        objCaptureSession?.startRunning()
        self.view.bringSubviewToFront(lblQRCodeResult)
        self.view.bringSubviewToFront(lblQRCodeLabel)
    }
    
    func initializeQRView() {
        vwQRCode = UIView()
        vwQRCode?.layer.borderColor = UIColor.redColor().CGColor
        vwQRCode?.layer.borderWidth = 5
        self.view.addSubview(vwQRCode!)
        self.view.bringSubviewToFront(vwQRCode!)
    }
    
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        if metadataObjects == nil || metadataObjects.count == 0 {
            vwQRCode?.frame = CGRectZero
            lblQRCodeResult.text = "NO QRCode text detected"
            return
        }
        let objMetadataMachineReadableCodeObject = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        if objMetadataMachineReadableCodeObject.type == AVMetadataObjectTypeQRCode {
            let objBarCode = objCaptureVideoPreviewLayer?.transformedMetadataObjectForMetadataObject(objMetadataMachineReadableCodeObject as AVMetadataMachineReadableCodeObject) as! AVMetadataMachineReadableCodeObject
            vwQRCode?.frame = objBarCode.bounds;
            if objMetadataMachineReadableCodeObject.stringValue != nil {
                // Code added to handle output result
                    //lblQRCodeResult.text = "True"
                if objMetadataMachineReadableCodeObject.stringValue == plants[array] {
                    self.performSegueWithIdentifier("trueTrans", sender: QRViewController())
                    return
                }
                else {
                    //lblQRCodeResult.text = objMetadataMachineReadableCodeObject.stringValue
                    //lblQRCodeResult.text = "False: " + objMetadataMachineReadableCodeObject.stringValue
                    self.performSegueWithIdentifier("falseTrans", sender: nil)
                    return
                }
                
                
            }  // end objMetadataMachineReadableCode conditional
        } // end objMetadataMachineReadableCodeObject.type conditional
    }  // end caputureOutput function
}  // end QRViewController class
