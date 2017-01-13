//
//  CategoryViewController.swift
//  RewardFinder
//
//  Written by Omar Baradei on 1/12/17.
//
//

import UIKit

enum PurchaseCategory {
    case dining
    case gas
    case shopping
    case groceries
    case hotel
    case flight
    
    var toString : String {
        switch self {
        // Use Internationalization, as appropriate.
        case .dining: return "dining";
        case .gas: return "gas";
        case .shopping: return "shopping";
        case .groceries: return "groceries";
        case .hotel: return "hotel";
        case .flight: return "flight";
        }
    }
}

class CategoryViewController: UIViewController {

    
    let resultsSegueIdentifier = "resultsSegue"
    
    var category: PurchaseCategory?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressedDining(_ sender: Any) {
        category = .dining
        performSegue(withIdentifier: resultsSegueIdentifier, sender: self)
    }
    
    @IBAction func pressedGroceries(_ sender: Any) {
        category = .groceries
        performSegue(withIdentifier: resultsSegueIdentifier, sender: self)
    }
    
    
    @IBAction func pressedHotel(_ sender: Any) {
        category = .hotel
        performSegue(withIdentifier: resultsSegueIdentifier, sender: self)
    }
    
    @IBAction func pressedFlight(_ sender: Any) {
        category = .flight
        performSegue(withIdentifier: resultsSegueIdentifier, sender: self)
    }
    
    @IBAction func pressedGas(_ sender: Any) {
        category = .gas
        performSegue(withIdentifier: resultsSegueIdentifier, sender: self)
    }
    
    @IBAction func pressedShopping(_ sender: Any) {
        category = .shopping
        performSegue(withIdentifier: resultsSegueIdentifier, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == resultsSegueIdentifier {
            (segue.destination as! ResultViewController).category = category!
        }
    }

}
