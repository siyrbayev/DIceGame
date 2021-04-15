//
//  HistoryPresenter.swift
//  IOS-Mobile-Dev-2-Assignment-1-Week-3
//
//  Created by ADMIN ODoYal on 14.04.2021.
//

import Foundation

protocol HistoryViewProtocol {
    
}

protocol HistoryViewPresenterProtocol {
    init(view: HistoryViewProtocol, ralls: [(first: Int, second: Int)]?)
    var ralls: [(first: Int, second: Int)]? {get set};
}

class HistoryPresenter: HistoryViewPresenterProtocol {
    let view: HistoryViewProtocol
    var ralls: [(first: Int, second: Int)]?
    
    required init(view: HistoryViewProtocol, ralls: [(first: Int, second: Int)]?) {
        self.view = view
        self.ralls = ralls ?? [(Int, Int)]()
    }
}
