//
//  MainGameInterfaceVC.swift
//  Slider
//
//  Created by Sonny on 2016-07-10.
//  Copyright © 2016 Sonny. All rights reserved.
//

import UIKit


class MainGameInterfaceVC: UIViewController {
    
    
    // MARK: - LIFECYCLE
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseFiveBackgroundsForThisLevel()
        genrateRandomBackgroundImage()
        print(imagesToUseInLevel)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - OUTLTETS & ACTIONS
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBAction func tempButton(sender: UIButton) {
        genrateRandomBackgroundImage()
        
    }
    
    
    // MARK: - GLOBAL CONSTANTS & VARIABLES
    
    let gameBrain = GameBrain() // Create an instance of the GameBrain
    
    let backgroundImageNames =  ["CityscapeBackground",
                                 "JungleBackground1",
                                 "JungleBackground2",
                                 "MountianScapeBackground",
                                 "PaisleyBackground",
                                 "RiverThroughItBackground",
                                 "RockBackground",
                                 "SaharaBackground",
                                 "SpookyBackground",
                                 "SportsTrackBackground",
                                 "TexasBackground",
                                 "ZebraBackground"]

    
    var imagesToUseInLevel: Array<String> = []
    
    // MARK: - FUNCTIONS
    
    func genrateRandomBackgroundImage() {
        
        if imagesToUseInLevel.count > 0 {
            
            let randomName = imagesToUseInLevel.randomElement()
            backgroundImage.image = UIImage(named: randomName)
            
            let indexOfRandomName = imagesToUseInLevel.indexOf(randomName)
            imagesToUseInLevel.removeAtIndex(indexOfRandomName!)
        }
        
        if imagesToUseInLevel.count == 1 {
            genrateRandomBackgroundImage()
            chooseFiveBackgroundsForThisLevel()
            print("new Array = \(imagesToUseInLevel)")
        }
    }
    
    func chooseFiveBackgroundsForThisLevel() {
        
        var origArray = backgroundImageNames
        
        
        for _ in 1...5 {
            
            let generatedNumber = Int(arc4random_uniform(UInt32(origArray.count)))
           
            let imageToAppend = origArray[generatedNumber]
            origArray.removeAtIndex(generatedNumber)
            
            imagesToUseInLevel.append(imageToAppend)
        }
 
    }

    
    func createBlurForOverlay() {
        let blurEffect = UIBlurEffect(style: .Light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        view.addSubview(blurEffectView)
    }
    
    
}



// MARK: - EXTENSIONS

extension Array {
    func randomElement() -> Element {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}