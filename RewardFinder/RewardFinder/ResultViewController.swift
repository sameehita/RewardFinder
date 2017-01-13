//
//  ViewController.swift
//  RewardFinder
//
//  Written by Omar Baradei on 1/12/17.
//
//

import UIKit

class ResultViewController: UIViewController {
    var category: PurchaseCategory!
    var data: Data!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "creditCards", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        data = try? Data(contentsOf: url)
        let creditCardData = parseJSON(for: data)
        //print(creditCardData!)
//        let companies = creditCardData?["cards"] as! [String: AnyObject]?
//        let cards = companies?["Capital One"] as! [String: AnyObject]?
//        let quickSilver = cards?["Quicksilver"] as! [String: AnyObject]?
//        let purchaseTypes = quickSilver?["purchaseType"] as! [String]?
        let eligibleCards = findBestReward(in: creditCardData)
        if eligibleCards.count > 0 {
            let bestCard = chooseBestCard(eligibleCards: eligibleCards)
            print(bestCard)
        }
    }
    
    func parseJSON(for data: Data!) -> [String: AnyObject]? {
        let json = try? JSONSerialization.jsonObject(with: data, options: [])
        if let dictionary = json as? [String: AnyObject] {
            return dictionary
        }
        return nil
    }
    
    func findBestReward(in creditCardData: [String:AnyObject]?) -> [String: Double] {
        var eligibleCards = [String: Double]()
        let companies = creditCardData?["cards"] as! [String: AnyObject]?
        for (key1, _) in companies! {
            let companyCards = companies?[key1] as! [String: AnyObject]?
            for (key2, _) in companyCards! {
                let cardInfo = companyCards?[key2] as! [String: AnyObject]?
                let purchaseTypes = cardInfo?["purchaseType"] as! [String]?
                let benefits = cardInfo?["Benefit"] as! [Double]?
                for (index, type) in purchaseTypes!.enumerated() {
                    if type.lowercased() ==  category.toString {
                        eligibleCards[key2] = benefits?[index]
                    }
                }
            }
        }
        return eligibleCards
    }
    
    func chooseBestCard(eligibleCards: [String: Double]) -> String {
        var bestBenefit: Double = 0
        var bestCard: String!
        for (card, benefit) in eligibleCards {
            if card == "Quicksilver" || card == "Venture" {
                if benefit >= bestBenefit {
                    bestBenefit = benefit
                    bestCard = card
                }
            } else if (benefit > bestBenefit) {
                bestBenefit = benefit
                bestCard = card
            }
        }
        return bestCard
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

