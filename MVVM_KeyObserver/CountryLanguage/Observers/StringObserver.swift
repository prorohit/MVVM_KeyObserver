//
//  GenericObserver.swift
//  MVVM_KeyObserver
//
//  Created by Rohit Singh on 1/15/19.
//  Copyright © 2019 iOSBuilder. All rights reserved.
//

import UIKit

class StringObserver {
    
    typealias Listner = (String?) -> Void
    
    var listener: Listner?
    
    var value: String? {
        didSet {
            listener?(value)
        }
    }
    
    func bind(listner: Listner?) {
        self.listener = listner
    }
    
}
