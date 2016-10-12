//
//  StarView.swift
//  Q1_StarView
//
//  Created by Luca Hagel on 10/12/16.
//  Copyright © 2016 Luca Hagel. All rights reserved.
//

import UIKit

class StarView: UIView {
    var starWidth: Double
    var numberOfStars: Int
    
    var starLabels: [UILabel] = []
    var filledStars: Int = 0
    
    init (frame: CGRect, numberOfStars: Int) {
        self.starWidth = Double(frame.width)/Double(numberOfStars)
        self.numberOfStars = numberOfStars
        
        super.init(frame: frame)
        
        var i = 0
        var xPos: Double = 0
        while i < numberOfStars {
            let frame = CGRect(x: xPos, y: 0, width: starWidth, height: starWidth)
            let starLabel = UILabel(frame: frame)
            starLabel.font = adaptiveFont(minSize: CGFloat(starWidth))
            let emptyStar: NSString = "☆"
            starLabel.text = emptyStar as String
            self.addSubview(starLabel)
            
            starLabels += [starLabel]
            xPos += starWidth
            i += 1
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update() {
        var t = 0
        var j = 0
        while t < numberOfStars {
            if j < filledStars {
                starLabels[t].text = "★"
                j += 1
            } else {
                starLabels[t].text = "☆"
            }
            t += 1
        }
    }
    
    func adaptiveFont(minSize: CGFloat = 1.0) -> UIFont {
        var tmpFontSize: CGFloat = 1.0
        
        var textStillFits = true
        while textStillFits {
            tmpFontSize = tmpFontSize + 1
            let font = UIFont.systemFont(ofSize: tmpFontSize)
            // TODO: improve algorithm
            let label = UILabel(frame: CGRect.zero)
            label.font = font
            label.text = "☆"
            label.sizeToFit()
            let textFrame = label.frame
            let difference = bounds.size.height - textFrame.size.height
            if difference > 0.0 {
                textStillFits = true
            }
            else {
                textStillFits = false
            }
        }
        
        return UIFont.systemFont(ofSize: tmpFontSize)
    }
    
    func fillStars(num: Int) {
        if num < Int(starWidth)/2 {
            self.filledStars = 0
            self.update()
        }
        else if num < Int(starWidth) + Int(starWidth)/2 {
            self.filledStars = 1
            self.update()
        }
        else if num < (2 * Int(starWidth) + Int(starWidth)/2) {
            self.filledStars = 2
            self.update()
        }
        else if num < (3 * Int(starWidth) + Int(starWidth)/2) {
            self.filledStars = 3
            self.update()
        }
        else if num < (4 * Int(starWidth) + Int(starWidth)/2) {
            self.filledStars = 4
            self.update()
        }
        else if num < (5 * Int(starWidth) + Int(starWidth)/2) {
            self.filledStars = 5
            self.update()
        }
        
//        self.filledStars = num / Int(starWidth)
//        self.update()
    }
}
