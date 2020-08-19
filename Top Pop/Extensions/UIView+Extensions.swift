//
//  UIView+Extensions.swift
//  Top Pop
//
//  Created by Domagoj Beronic on 19/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

extension UIView {
    
    func setGradientBackground(startColor: UIColor, endColor: UIColor) {
        let gradientLayerName = "gradientLayer"
        
        if let oldLayer = layer.sublayers?.filter({ $0.name == gradientLayerName }).first {
            oldLayer.removeFromSuperlayer()
        }
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.8, y: 0.0)
        gradientLayer.name = gradientLayerName
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setContainerView() {
        layer.cornerRadius = 10
        layer.shadowOpacity = 1
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.masksToBounds = true
        backgroundColor = .darkGray
    }
}
