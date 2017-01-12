//
//  CategoryViewController.swift
//  RewardFinder
//
//  Created by Omar Baradei on 1/12/17.
//
//

import UIKit

enum PurchaseCategory {
    case food
    case travel
    case entertainment
    case gas
    case shopping
}

class CategoryViewController: UIViewController {

    
    let categorySegueIdentifier = "categorySegue"
    
    var category: PurchaseCategory?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func foodPressed(_ sender: Any) {
        category = .food
        performSegue(withIdentifier: categorySegueIdentifier, sender: self)
    }
    
    
    @IBAction func travelPressed(_ sender: Any) {
    }
    
    @IBAction func entertainmentPressed(_ sender: Any) {
    }
    
    @IBAction func gasPressed(_ sender: Any) {
    }
    
    @IBAction func shoppingPressed(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == categorySegueIdentifier {
            (segue.destination as! ResultViewController).category = category
        }
    }

}
