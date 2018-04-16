//
//  HomeCell.swift
//  SwiftTest
//
//  Created by 周凯丽 on 2018/4/16.
//  Copyright © 2018年 周凯丽. All rights reserved.
//

import UIKit
import Kingfisher
class HomeCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var labl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let url = URL(string: "http://c.hiphotos.baidu.com/image/h%3D300/sign=565c7da6fc1f3a2945c8d3cea925bce3/fd039245d688d43f5d9c4d8a711ed21b0ef43b95.jpg")

        imgView.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
    }

    
}
