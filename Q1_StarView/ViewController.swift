//
//  ViewController.swift
//  Q1_StarView
//
//  Created by Luca Hagel on 10/12/16.
//  Copyright © 2016 Luca Hagel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    var myStarView: StarView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let demoFrame = CGRect(x: 0, y: 100.0, width: self.view.frame.width, height: 100)
        self.myStarView = StarView(frame: demoFrame, numberOfStars: 5)
        myStarView.backgroundColor = UIColor.red
        self.view.addSubview(myStarView)
        
//        myStarView.fillStars(num: 3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches {
            
            let location = touch.location(in: self.myStarView)
            print(location)
            self.myStarView.fillStars(num: Int(location.x))
            self.ratingLabel.text = String(self.myStarView.filledStars) + " Stars"
        }
    }
}

