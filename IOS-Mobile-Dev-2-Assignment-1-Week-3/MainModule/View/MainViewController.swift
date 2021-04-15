//
//  MainViewController.swift
//  IOS-Mobile-Dev-2-Assignment-1-Week-3
//
//  Created by ADMIN ODoYal on 14.04.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak private var dicesStack: UIStackView!
    @IBOutlet weak private var rollButton: UIButton!
    @IBOutlet weak private var firstDiceImage: UIImageView!
    @IBOutlet weak private var secondDiceImage: UIImageView!
    @IBOutlet weak private var historyButton: UIButton!
    var presenter: MainViewPresenterProtocol!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?){
        if motion == .motionShake {
            didTapRollButton(AnyClass.self)
        }
    }
    
    @IBAction func didTapRollButton(_ sender: Any) {
        presenter.showDiceCombination()
    }
    
    @IBAction func didTapHistoryButton(_ sender: Any) {
        let ralls = presenter.ralls
        let vc = ModuleBuilder.createHistoryModule(ralls: ralls, mainPresenter: presenter)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension MainViewController: MainViewProtocol{
    
    func setDiceCombination(_ firstDiceName: String, _ secondDiceName: String) {
        self.firstDiceImage.image = UIImage(named: firstDiceName)
        self.secondDiceImage.image = UIImage(named: secondDiceName)
    }
}
