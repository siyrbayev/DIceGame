//
//  HistoryViewController.swift
//  IOS-Mobile-Dev-2-Assignment-1-Week-3
//
//  Created by ADMIN ODoYal on 14.04.2021.
//

import UIKit

class HistoryViewController: UIViewController {
    @IBOutlet weak private var historyTableView: UITableView!
    public var callback: (((first: Int,second: Int))->())?
    var presenter: HistoryViewPresenterProtocol!
    var mainpresenter:  MainViewPresenterProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTableView.delegate = self
        historyTableView.dataSource = self
        historyTableView.register(HistoryTableViewCell.nib, forCellReuseIdentifier: HistoryTableViewCell.identifier)
        historyTableView.backgroundColor = .none
    }
    
    @IBAction func didTapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension HistoryViewController: HistoryViewProtocol{
    
}

extension HistoryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.ralls?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier, for: indexPath) as? HistoryTableViewCell {
            
            if let rall = presenter.ralls?[indexPath.row]{
                cell.configureCell( rall: rall)
                cell.contentView.backgroundColor = UIColor(red: 119/255.0, green: 136/255.0, blue: 27/255.0, alpha: 1)
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let rall = presenter.ralls?[indexPath.row] else {
            return
        }
        print(rall)
        mainpresenter.showSelectedDiceCombination(rall.first, rall.second)
        presenter.ralls = nil
        self.navigationController?.popViewController(animated: true)
    }
}
