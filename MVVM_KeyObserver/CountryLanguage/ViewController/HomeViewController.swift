//
//  HomeViewController.swift
//  MVVM_KeyObserver
//
//  Created by Rohit Singh on 1/21/19.
//  Copyright © 2019 iOSBuilder. All rights reserved.
//

// https://stackoverflow.com/questions/26613053/initcoder-has-not-been-implemented-in-swift/26614829
import UIKit

class HomeViewController: UIViewController {
    
    class var name: String {
        return String.init(describing: self)
    }

    override func viewDidLoad() {
        self.view.backgroundColor = .red
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    init?(nameOfClass: String) {
        super.init(nibName: nil, bundle: nil)
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let _ = storyBoard.instantiateViewController(withIdentifier: nameOfClass) as? HomeViewController else {
            return nil
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
