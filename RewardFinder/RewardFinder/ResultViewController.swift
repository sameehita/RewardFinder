//
//  ViewController.swift
//  RewardFinder
//
//  Created by Casey Chien on 1/12/17.
//
//

import UIKit

class ResultViewController: UIViewController {
    var category: PurchaseCategory!
    var data: Data!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var myDictionary: [String: String]
        myDictionary = ["Jessica": "Sloan"]
        print(myDictionary)
        
        let path = Bundle.main.path(forResource: "creditCards", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        data = try? Data(contentsOf: url)
        
        let json = try? JSONSerialization.jsonObject(with: data!, options: [])
        
        print(JSONSerialization.isValidJSONObject(json))
        
        if let dictionary = json as? [String: Any?] {
            let cards = dictionary["cards"] as! [String: Any?]
            print(cards.keys.count)
        }
                
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}

