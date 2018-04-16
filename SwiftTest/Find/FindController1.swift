//
//  FindController1.swift
//  SwiftTest
//
//  Created by 周凯丽 on 2018/4/16.
//  Copyright © 2018年 周凯丽. All rights reserved.
//

import UIKit
import Alamofire

class FindController1: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var scroll: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        //http://tj.nineton.cn/Heart/index/future24h/?city=CHSH000000
        let dic = ["city":"CHSH000000"]
        let url:String = "http://tj.nineton.cn/Heart/index/future24h/"
        
        
        Alamofire.request(url, method: .get, parameters: dic, encoding: URLEncoding.default, headers: nil).responseJSON { (respond) in
            if let JSON = respond.result.value {
                print("JSON: \(JSON)")
                let data : NSData! = try! JSONSerialization.data(withJSONObject: JSON, options: []) as NSData?
                let str = String(data: data as Data, encoding: String.Encoding.utf8)
                self.lbl.text = str;
                
                let rect =  UIScreen.main.bounds;
                let width = rect.size.width;
                
                
                let option = NSStringDrawingOptions.usesLineFragmentOrigin
                let size = CGSize(width: width, height: 10000)
                let rect2:CGRect = str!.boundingRect(with: size, options: option, attributes:  [NSAttributedStringKey.font: self.lbl.font], context: nil)
                self.lbl.frame = CGRect(x: 0, y: 0, width: width, height: ceil(rect2.size.height))
                
                self.scroll.contentSize = CGSize(width: width, height: ceil(rect2.size.height));
                
            }
        }
        
    }

 

}
