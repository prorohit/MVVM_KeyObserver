//
//  GenericViewModel.swift
//  MVVM_KeyObserver
//
//  Created by Rohit Singh on 1/15/19.
//  Copyright © 2019 iOSBuilder. All rights reserved.
//

import UIKit

class GenericViewModel {
    
    var countryCode = StringObserver()
    
    var currencyCodes:GenericObserver<[String]> = GenericObserver<[String]>([""])

    func getCountryResponse(with storeId: String) {
        let session = URLSession.shared
        
        let stringUrl = String(format: "https://middlewaredev.erabiamobile.com:9070/rest/v1/config/stores/%@/country-config", storeId)
        guard let urlOfCountryAPI = URL(string: stringUrl) else {
            return
        }
        
        let headers = ["accept": "application/json",
                       "appId": "IOS",
                       "appVersion": "767",
                       "ENV": "UAT2"]
        
        var urlRequest = URLRequest(url: urlOfCountryAPI)
        
        // Setting the HTTP header
        urlRequest.allHTTPHeaderFields = headers
        
        session.dataTask(with: urlRequest) {[weak self] (data, response, error) in
            
            guard let data = data else {
                return
            }
            do {
               let jsonResponse = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
                print(jsonResponse)
                guard let jsonDictionary = jsonResponse as? [String: Any],
                    let dataResponse = jsonDictionary["data"] as? [String: Any] else {
                        return
                }
                
                if let countryOfOperationID = dataResponse["countryOfOperationID"] as? String {
                    self?.countryCode.value = countryOfOperationID
                }
                
                if let currencyCodes = dataResponse["currencyCode"] as? [String] {
                    self?.currencyCodes.valueGeneric = currencyCodes
                }
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()

    }
    
}
