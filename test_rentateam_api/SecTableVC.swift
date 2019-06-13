//
//  SecTableVC.swift
//  test_rentateam_api
//
//  Created by Виталий on 13/06/2019.
//  Copyright © 2019 kaboo. All rights reserved.
//

import UIKit

class SecTableVC: UITableViewController {

    private let id = "http://megakohz.bget.ru/test.php?id="
    var idOfCompany: String?
    
    fileprivate var companies = [Company]()
    fileprivate let presenter = SecondTablePresenter(dataService: NetworkManager())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter.attachView(self)
        tableView.register(SecondTableViewCell.self, forCellReuseIdentifier: SecondTableViewCell.reuseId)
        tableView.tableFooterView = UIView(frame: .zero)
        uploadInfo()
    }
    
    private func uploadInfo() {
        guard let idOfComp = idOfCompany else { return }
        let stringUrl = id + idOfComp
        print (stringUrl)
        self.presenter.info(string: stringUrl)
    }
}

extension SecTableVC: SecondViewProtocol {
    func setInfo(info: [Company]) {
        self.companies = info
//        self.title = companies.first?.name
        tableView.reloadData()
        print (companies)
    }
}

extension SecTableVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SecondTableViewCell.reuseId, for: indexPath) as? SecondTableViewCell
            else { return UITableViewCell() }

        cell.cardCompany.text = companies.first?.description
        
        return cell
    }
}
