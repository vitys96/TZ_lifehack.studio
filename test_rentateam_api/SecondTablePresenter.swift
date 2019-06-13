//
//  SecondTablePresenter.swift
//  test_rentateam_api
//
//  Created by Виталий on 13/06/2019.
//  Copyright © 2019 kaboo. All rights reserved.
//

import Foundation

class SecondTablePresenter {
    
    weak private var secondView: SecondViewProtocol?
    private let dataService: NetworkManager!
    
    
    init(dataService: NetworkManager) {
        self.dataService = dataService
    }
    
    func attachView(_ viewProtocol: SecondViewProtocol) {
        self.secondView = viewProtocol
    }
    
    func info(string: String) {
        dataService.fetchData(string: string) { [weak self] info in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.secondView?.setInfo(info: info)
            }
            
        }
    }
}
