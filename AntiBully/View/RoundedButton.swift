//
//  RoundedButton.swift
//  AntiBully
//
//  Created by Fred Lefevre on 2020-04-11.
//  Copyright © 2020 Fred Lefevre. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    override func awakeFromNib() {
        layer.borderWidth = 3
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
    }

}
