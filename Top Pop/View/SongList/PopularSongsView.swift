//
//  PopularSongsView.swift
//  Top Pop
//
//  Created by Domagoj Beronic on 19/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import Foundation
import UIKit

class PopularSongsView: UIView {
    
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.setGradientBackground(startColor: .purple, endColor: .red)
        backgroundColor = .black
        setUpElements()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUpElements(){
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.backgroundColor = .black
        tableView.rowHeight = 90
        tableView.sectionFooterHeight = 30
    }
    
    private func setUpConstraints(){
        let margin: CGFloat = 20
        
        tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: margin).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -margin).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: margin).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -margin).isActive = true
    }
}
