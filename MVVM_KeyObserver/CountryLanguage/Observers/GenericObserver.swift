//
//  GenericObserver.swift
//  MVVM_KeyObserver
//
//  Created by Rohit Singh on 1/15/19.
//  Copyright © 2019 iOSBuilder. All rights reserved.
//

import UIKit

class GenericObserver<T> {
    
    typealias Listner = (T) -> Void
    
    var listener: Listner?
    
    var valueGeneric: T {
        didSet {
            listener?(valueGeneric)
        }
    }
    
    func bind(listner: Listner?) {
        self.listener = listner
        listener?(valueGeneric)

    }
    
    init(_ v: T) {
        valueGeneric = v
    }

}
