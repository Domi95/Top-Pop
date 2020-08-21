//
//  UITableView + Extensions.swift
//  Top Pop
//
//  Created by Domagoj Beronic on 20/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

extension UITableView {
    
    func setTableView(bgColor: UIColor = .black, rowHeight: CGFloat = 90) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.rowHeight = rowHeight
        self.backgroundColor = bgColor
    }
}
