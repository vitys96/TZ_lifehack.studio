//
//  MainTableVC.swift
//  test_rentateam_api
//
//  Created by Виталий Охрименко on 05/06/2019.
//  Copyright © 2019 kaboo. All rights reserved.
//

import UIKit

class MainTableVC: UITableViewController {
    
    
    fileprivate var companies = [Company]()
    fileprivate let presenter = PhotoPresenter(dataService: NetworkManager())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.attachView(self)
        self.presenter.getPhotos()
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.reuseId)
    }
}

extension MainTableVC: PhotoViewProtocol {
    
    func setInfo(photos: [Company]) {
        self.companies = photos
        self.tableView.reloadData()
    }
}

extension MainTableVC {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.companies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseId, for: indexPath) as? MainTableViewCell
            else { return UITableViewCell() }
        cell.nameLabel.text = companies[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondVC = SecTableVC()
        secondVC.idOfCompany = companies[indexPath.row].id
        secondVC.navigationItem.title = companies[indexPath.row].name
        
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
}
