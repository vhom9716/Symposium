//
//  SelectButton.swift
//  testVH
//
//  Created by Student on 4/13/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class SelectButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var select: Bool = false;
    var imgSrc: String =  ""
    func change(){
        select = !select
        if select{
            self.layer.borderWidth = 0.8
            self.layer.borderColor = UIColor.gray.cgColor
        }
        else{
            self.layer.borderWidth = 0
        }
    }
}
