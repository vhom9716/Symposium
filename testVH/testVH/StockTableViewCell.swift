//
//  StockTableViewCell.swift
//  testVH
//
//  Created by Student on 6/1/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class StockTableViewCell: UITableViewCell {

    @IBOutlet weak var stockOwned: UILabel!
    @IBOutlet weak var stockName: UILabel!
    @IBOutlet weak var price: UILabel!
    var stock: Stock!
    override func awakeFromNib() {
        super.awakeFromNib()
        price.layer.cornerRadius = 8.0
        price.layer.masksToBounds = true
//        price.backgroundColor = stock.color
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
