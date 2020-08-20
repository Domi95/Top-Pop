//
//  UIView+Extensions.swift
//  Top Pop
//
//  Created by Domagoj Beronic on 19/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

extension UIView {
    
    func setContainerView() {
        layer.cornerRadius = 10
        layer.shadowOpacity = 1
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.masksToBounds = true
        backgroundColor = .darkGray
    }
}
