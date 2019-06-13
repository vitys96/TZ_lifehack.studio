//
//  SecondVC.swift
//  test_rentateam_api
//
//  Created by Виталий Охрименко on 05/06/2019.
//  Copyright © 2019 kaboo. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    
    private let id = "http://megakohz.bget.ru/test.php?id="
    var idOfCompany: String?
    private var companies = [Company]()
    fileprivate let presenter = SecondTablePresenter(dataService: NetworkManager())
    
    let cardCompany: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .thin)
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.view.addSubview(cardCompany)
        self.presenter.attachView(self)
        uploadData()
        configureLabel()
    }
    
    private func uploadData() {
        guard let idOfComp = idOfCompany else { return }
        let stringUrl = id + idOfComp
        self.presenter.info(string: stringUrl)
    }
    
    
    private func configureLabel() {
        cardCompany.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        cardCompany.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
}

extension SecondVC: SecondViewProtocol {
    func setInfo(info: [Company]) {
        self.companies = info
    }
}
