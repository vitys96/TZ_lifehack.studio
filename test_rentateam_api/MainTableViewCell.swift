//
//  MainTableViewCell.swift
//  test_rentateam_api
//
//  Created by Виталий Охрименко on 05/06/2019.
//  Copyright © 2019 kaboo. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    static let reuseId = "MainTableVCCell"
    
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        return label
    }()
    
    override func prepareForReuse() {
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        labelCompany()
    }
    
    private func labelCompany() {
        addSubview(nameLabel)
        
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
