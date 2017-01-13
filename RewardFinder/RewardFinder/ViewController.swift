//
//  ViewController.swift
//  RewardFinder
//
//  Created by Casey Chien on 1/12/17.
//
//

import UIKit

class ViewController: UIViewController {
    @IBAction func buttonPressed(_ sender: Any) {
        print("Hello")
    }

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var title_text: UILabel!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

