//
//  SecondTableViewCell.swift
//  test_rentateam_api
//
//  Created by Виталий on 13/06/2019.
//  Copyright © 2019 kaboo. All rights reserved.
//

import UIKit

class SecondTableViewCell: UITableViewCell {

    static let reuseId = "MainTableVCCell"
    
    
    let cardCompany: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureLabel()
    }
    
    private func configureLabel() {
        
        addSubview(cardCompany)
        cardCompany.fillSuperview(padding: UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
