//
//  ViewController.swift
//  CoinFlip
//  IT 315 Project One
//  Disclaimer: This is an app developed as an educational project. No copyright intended.
//  Certain Materials are under the fair use exemption of the U.S. Copyright Law and have
//  Been prepared according to the multimedia fair use guidelines and are restricted from further use
//  Created by Tim Nguyen on 3/22/23.
//

import UIKit
import AVKit


class ViewController: UIViewController {
    var clickCount: Int = 0
    
    @IBOutlet weak var coinButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var clicksLabelOutlet: UILabel!
    
    // btnOpenSite opens Website to a Wiki link
    @IBAction func btnOpenSite(_ sender: Any) {
        let browserApp = UIApplication.shared
        let url = URL(string:"https://randomwordgenerator.com/coin-flip.php")
        browserApp.open(url!)
    }
    
    var mySoundFile:AVAudioPlayer! // declare sound object
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlObject = URL(fileURLWithPath: Bundle.main.path(forResource:"coinflip_sfx",
                                                              ofType: "wav")!)
        mySoundFile = try? AVAudioPlayer(contentsOf: urlObject)
        // Do any additional setup after loading the view.
        clicksLabelOutlet.text = "0" //sets click label to 0
        
    }

    @IBAction func coinButtonAction(_ sender: Any) {
        let status = Bool.random()
        if status {
            //if status is true or heads then do:
            
            coinButton.setImage(UIImage(named: "heads"), for: .normal)
            
            statusLabel.text = "Heads"
            mySoundFile.play() //plays coin flip sound
            clickCount = clickCount + 1
            clicksLabelOutlet.text = "\(clickCount)" //adds 1 to the count after converting to a string
        }
        else
        {
            //if status is false or tails then do:

            coinButton.setImage(UIImage(named: "tails"), for: .normal)

            statusLabel.text = "Tails"
            mySoundFile.play() //plays coin flip sound
            clickCount = clickCount + 1
            clicksLabelOutlet.text = "\(clickCount)" //adds 1 to the count after converting to a string
        }

        doAnimationCoin(coinButton)
    }
    
    //coin flip animation
    func doAnimationCoin(_ button:UIButton) {
        let coinFlip = CATransition()
        coinFlip.startProgress = 0.0
        coinFlip.endProgress = 1.0
        coinFlip.type = CATransitionType(rawValue: "flip")
        coinFlip.subtype = CATransitionSubtype(rawValue: "fromRight")
        coinFlip.duration = 0.1
        coinFlip.repeatCount = 5
        button.layer.add(coinFlip, forKey: "transition")
    }
}

