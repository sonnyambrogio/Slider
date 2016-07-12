//
//  GameBrain.swift
//  Slider
//
//  Created by Sonny on 2016-07-10.
//  Copyright © 2016 Sonny. All rights reserved.
//

import Foundation
import UIKit

class GameBrain {
    let numberOfRoundsPerLevel: Int = 5
    let numberOfLevels: Int = 1
    
    let roundOneMaxSliderValue: Int = 100
    let roundTwoMaxSliderValue: Int = 150
    let roundThreeMaxSliderValue: Int = 200
    let roundFourMaxSliderValue: Int = 250
    let roundFiveMaxSliderValue: Int = 300

    
    let gameOverImageNames =    ["GameOverRed",
                                 "GameOverBlue",
                                 "GameOverOrange"]
    
    
    
    
    
    func generateRandonNumberForSlider(maxSliderValue: Int) -> Int {
        let msv = maxSliderValue
        let randomNumber = Int(arc4random_uniform(UInt32(msv)))
        return randomNumber
    }
    
    func generateRandomImageForBackground() {
        
    }
    
}