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
        let creditCardData = parseJSON(for: data)
        let bestCard = findBestReward(in: creditCardData)
        
    }
    
    func parseJSON(for data: Data!) -> [String: Any?]? {
        let json = try? JSONSerialization.jsonObject(with: data!, options: [])
        if let dictionary = json as? [String: Any?] {
            return dictionary
        }
        return nil
    }
    
    func findBestReward(in creditCardData: [String:Any]?) -> String? {
        return nil
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

