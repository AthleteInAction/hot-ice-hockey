//
//  MenuCTRL.swift
//  hot-ice-hockey
//
//  Created by grobinson on 8/19/15.
//  Copyright (c) 2015 Wambl. All rights reserved.
//

import UIKit

var platforms: [String] = ["xbox","ps3"]

class MenuCTRL: UITableViewController {

    @IBOutlet weak var platform: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Tools.rd() != nil {
            
            platform.selectedSegmentIndex = Tools.rd()!
            
        } else {
            
            Tools.wrt("0")
            
            platform.selectedSegmentIndex = 0
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }
    
    @IBAction func platformChanged(sender: AnyObject) {
        
        println("CHANGED")
        
        Tools.wrt("\(platform.selectedSegmentIndex)")
        
    }

}

class Tools {
    
    static func wrt(s: String){
        
        let file = "platform.i"
        
        if let dirs : [String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String] {
            let dir = dirs[0] //documents directory
            let path = dir.stringByAppendingPathComponent(file)
            
            //writing
            s.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding, error: nil)
            
            //reading
            let text2 = String(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: nil)
        }
        
    }
    
    static func rd() -> Int? {
        
        let file = "platform.i"
        
        if let dirs : [String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String] {
            let dir = dirs[0] //documents directory
            let path = dir.stringByAppendingPathComponent(file)
            
            //reading
            let text2 = String(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: nil)
            
            return text2?.toInt()
            
        }
        
        return nil
        
    }
    
}