//
//  UIButton + Extensions.swift
//  Top Pop
//
//  Created by Domagoj Beronic on 20/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

extension UIButton {
    
    func style(isHidden: Bool = false, cornerRadius: CGFloat = 25, size: CGFloat = 16, bgColor: UIColor = .black, text: String = "", titleColor: UIColor = .white) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(text, for: .normal)
        self.isHidden = isHidden
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = cornerRadius
        self.titleLabel?.font = UIFont.systemFont(ofSize: size, weight: .bold)
        self.backgroundColor = bgColor
        self.setTitleColor(titleColor, for: .normal)
    }
}
