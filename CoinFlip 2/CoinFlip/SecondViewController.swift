//
//  SecondViewController.swift
//  CoinFlip
//
//  Created by Tim Nguyen on 5/7/23.
//  Copyright © 2023 RADEFFFACTORY. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!

    @IBAction func chooseButtonTapped(_ sender: UIButton) {
        let choices = inputTextField.text?.components(separatedBy: ",")
        if let choices = choices, !choices.isEmpty {
            let randomIndex = Int.random(in: 0..<choices.count)
            outputLabel.text = choices[randomIndex].trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
