//
//  UILabel+Extensions.swift
//  Top Pop
//
//  Created by Domagoj Beronic on 19/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

extension UILabel {
    
    func style(size: CGFloat = 20, text: String = "", textColor: UIColor = .white) {
        self.font = .boldSystemFont(ofSize: size)
        self.textColor = textColor
        self.text = text
        self.textAlignment = .center
        self.clipsToBounds = true
        self.adjustsFontSizeToFitWidth = true
        self.numberOfLines = 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
