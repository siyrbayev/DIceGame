//
//  HistoryTableViewCell.swift
//  IOS-Mobile-Dev-2-Assignment-1-Week-3
//
//  Created by ADMIN ODoYal on 14.04.2021.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    public static let identifier: String = "HistoryTableViewCell"
    public static let nib = UINib(nibName: identifier, bundle: Bundle(for: HistoryTableViewCell.self))
    
    @IBOutlet weak private var secondDiceNumberLabel: UILabel!
    @IBOutlet weak private var firstDiceNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell( rall: (first: Int, second: Int)) {
        self.firstDiceNumberLabel.text = "first:  " + String(rall.first+1)
        self.secondDiceNumberLabel.text = "second:  " + String(rall.second+1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
