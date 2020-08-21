//
//  PopularSongsView.swift
//  Top Pop
//
//  Created by Domagoj Beronic on 19/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit
import DropDown

class PopularSongsView: UIView {
    
    let tableView = UITableView()
    var refreshControl = UIRefreshControl()
    let dropDownButton = UIButton()
    let menu: DropDown = {
        let menu = DropDown()
        menu.dataSource = ["Normal", "ASC", "DESC"]
        return menu
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        setUpElements()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUpElements(){
        addSubview(tableView)
        tableView.setTableView()
        tableView.refreshControl = refreshControl
        
        addSubview(dropDownButton)
        dropDownButton.style()
        dropDownButton.setImage(UIImage(named: "sortImage"), for: .normal)
        
        addSubview(menu)
        
        refreshControl.tintColor = .white
    }
    
    private func setUpConstraints(){
        let margin: CGFloat = 20
        
        tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -margin).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: margin).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -margin).isActive = true
        
        dropDownButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        dropDownButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5).isActive = true
        dropDownButton.widthAnchor.constraint(equalToConstant: 45).isActive = true
        dropDownButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        menu.anchorView = dropDownButton
    }
}
