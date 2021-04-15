//
//  ModuleBuilder.swift
//  IOS-Mobile-Dev-2-Assignment-1-Week-3
//
//  Created by ADMIN ODoYal on 14.04.2021.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
    static func createHistoryModule(ralls: [(first: Int, second: Int)]?, mainPresenter: MainViewPresenterProtocol) -> UIViewController
}

class ModuleBuilder: Builder {
    static func createHistoryModule(ralls: [(first: Int, second: Int)]?, mainPresenter: MainViewPresenterProtocol) -> UIViewController {
        let view = HistoryViewController()
        let presenter = HistoryPresenter(view: view, ralls: ralls)
        view.presenter = presenter
        view.mainpresenter = mainPresenter
        return view
    }
    
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let presenter = MainPresenter(view: view)
        view.presenter = presenter
        return view
    }
}
