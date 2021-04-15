//
//  MainPresenter.swift
//  IOS-Mobile-Dev-2-Assignment-1-Week-3
//
//  Created by ADMIN ODoYal on 14.04.2021.
//

import Foundation

protocol MainViewProtocol: class {
    func setDiceCombination(_ firstDiceName:String, _ secondDiceName:String)
}

protocol MainViewPresenterProtocol: class {
    var ralls: [(first: Int, second: Int)]  { get };
    init(view: MainViewProtocol)
    func showDiceCombination()
    func addToRalls(_ first: Int,_ second: Int)
    func showSelectedDiceCombination(_ first: Int, _ second: Int)
}

class MainPresenter: MainViewPresenterProtocol {
    var ralls: [(first: Int, second: Int)]
    let view: MainViewProtocol
    
    private var dices: [String] = ["dice1","dice2","dice3","dice4","dice5","dice6"]
    

    required init(view: MainViewProtocol) {
        self.view = view
        self.ralls = [(first: Int, second: Int)]()
    }
    
    func showSelectedDiceCombination(_ first: Int, _ second: Int){
        self.view.setDiceCombination(self.dices[first], self.dices[second])
    }
    
    func showDiceCombination(){
        let firstDiceNumber = Int(arc4random())%6
        let secondDiceNumber = Int(arc4random())%6
        
        addToRalls(firstDiceNumber, secondDiceNumber)
        
        self.view.setDiceCombination(self.dices[firstDiceNumber], self.dices[secondDiceNumber])
    }
    
    func addToRalls(_ first: Int, _ second: Int) {
        ralls.append((first, second))
    }
}
