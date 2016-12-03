//
//  ViewController.swift
//  Connect Views
//
//  Created by Banfield Hospital on 11/25/16.
//  Copyright © 2016 Banfield Hospital. All rights reserved.
//

import UIKit



class ViewController: UIViewController, PresentedViewControllerDelegate,UINavigationControllerDelegate{
    
    

    @IBOutlet weak var textOutlet: UILabel!
    @IBAction func doPresent(sender: AnyObject) {
        
        let pvc = storyboard?.instantiateViewController(withIdentifier: "PresentedViewController") as! PresentedViewController
        pvc.data = "important data sent via delegate!" as AnyObject?
        pvc.delegate = self
        self.present(pvc, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        navigationController?.delegate = self
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func acceptData(data: AnyObject!) {
        self.textOutlet.text = "\(data!)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SendDataSegue" {
            if segue.destination is UINavigationController {
                
                let destinationViewController = segue.destination as? UINavigationController
                
                if (destinationViewController != nil)
                {
                    destinationViewController?.delegate = self
                }
            }
        }

    }
    
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
        if let controller = viewController as? UINavigationController {
            self.textOutlet.text = controller
            
            // Here you pass the data back to your original view controller
        }
    }
    
    
}

