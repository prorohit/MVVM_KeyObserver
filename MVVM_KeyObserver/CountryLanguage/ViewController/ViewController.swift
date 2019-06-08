//
//  ViewController.swift
//  MVVM_KeyObserver
//
//  Created by Rohit Singh on 1/15/19.
//  Copyright © 2019 iOSBuilder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storeIdTextField: UITextField!
    @IBOutlet weak var getResponseButton: UIButton!
    @IBOutlet weak var responseLabel: UILabel!
    
    let viewModel = GenericViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.countryCode.bind {[weak self] (val) in
            DispatchQueue.main.async {
                self?.responseLabel.text = val

            }
        }
        
        viewModel.currencyCodes.bind {[weak self] (val) in
            print(val)
        }
        
    }
    
    
    
    @IBAction func tapGetCountryResponse(_ sender: UIButton) {
        if let storeId = storeIdTextField.text, !storeId.isEmpty {
            viewModel.getCountryResponse(with: storeIdTextField.text ?? "")
        }
        
    }
    
    @IBAction func tapGoToHome(_ sender: UIButton) {
        if let homeObject = HomeViewController(nameOfClass: HomeViewController.name) {
            navigationController?.pushViewController(homeObject, animated: true)
        }
      }
    

}

