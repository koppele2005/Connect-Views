//
//  PresentedViewController.swift
//  Connect Views
//
//  Created by Banfield Hospital on 11/25/16.
//  Copyright © 2016 Banfield Hospital. All rights reserved.
//

import UIKit



protocol PresentedViewControllerDelegate {
    func acceptData(data: AnyObject!)
}

class Data {
    var array: String = ""
}

class PresentedViewController: UIViewController {
    
    // create a variable that will recieve / send messages
    // between the view controllers.
    var delegate : PresentedViewControllerDelegate?
    // another data outlet
    var data = Data()
    
    @IBOutlet weak var textFieldOutlet: UITextField!
    @IBAction func doDismiss(sender: AnyObject) {
        
        if textFieldOutlet.text != "" {
            self.presentingViewController!.dismiss(animated: true, completion: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("\(data!)")

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.isBeingDismissed {
            self.delegate?.acceptData(data: textFieldOutlet.text as AnyObject!)
            //let d = Data()
            data.array = textFieldOutlet.text!
        }
    }
}
