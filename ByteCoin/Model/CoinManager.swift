//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol BitcoinDelegate{
    func currencyName(answer: [String : Any])
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "4B064228-DCF1-4569-966B-11FCD8573FB3"
    var delegate : BitcoinDelegate?
    
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func fetchFullApi(currency:String){
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performRequest(urlString)
        
    }
    
    
    
    func performRequest(_ urlTemp:String){
        let url = URL(string: urlTemp)
        let urlSession = URLSession(configuration: .default)
        print(urlSession)
        let task = urlSession.dataTask(with: url!){data, response, error in
            if error != nil{
                print(error!)
            }else{
                if let safedata = data{
                    do {
                        let json = try JSONSerialization.jsonObject(with: safedata, options: []) as? [String : Any]
                        delegate?.currencyName(answer:json ?? [:])
                    } catch {
                        print("errorMsg")
                    }
//                    let ans = jsonParser(safedata)
                }
            }
            
        }
        task.resume()
    }
    
//    func jsonParser(_ dataString:Data) -> String{
//        let decoder = JSONDecoder()
//        do{
//            let decodedData = try decoder.decode(BitcoinParse.self, from: dataString)
//            return String(format: "%.2f",decodedData.rate)
//        }catch{
//            print(error)
//            return ""
//        }
//    }
    
}
