//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate,BitcoinDelegate {
    
    
    
    func currencyName(answer: [String : Any]) {
        print("Hello")
        DispatchQueue.main.async {
            let rate = answer["rate"] as! Double
//            print(String(format: "%.2f", rate))
            self.bitcoinLabel.text = String(format: "%.2f", rate)
            self.currencyLabel.text = answer["asset_id_quote"] as? String
        }
        
        print(answer)

    }
    
   
    
    
    
    var coinManager = CoinManager()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        coinManager.fetchFullApi(currency: coinManager.currencyArray[row])
    }
    
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var bitcoinLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        coinManager.delegate = self
        // Do any additional setup after loading the view.
       
    }
    
    
    
    


}
