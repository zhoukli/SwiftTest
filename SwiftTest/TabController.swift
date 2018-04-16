//
//  TabController.swift
//  SwiftTest
//
//  Created by 周凯丽 on 2018/4/16.
//  Copyright © 2018年 周凯丽. All rights reserved.
//

import UIKit

class TabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let nav1 = UINavigationController(rootViewController: HomeController())
        let nav2 = UINavigationController(rootViewController: FindController1())
        let nav3 = UINavigationController(rootViewController: MineController())

        self.setItem(vc: nav1, name: "首页", image: UIImage(named: "tab2")!, selectImage: UIImage(named: "tab1")!)
        self.setItem(vc: nav2, name: "发现", image: UIImage(named: "tab4")!, selectImage: UIImage(named: "tab3")!)
        self.setItem(vc: nav3, name: "我的", image: UIImage(named: "tab6")!, selectImage: UIImage(named: "tab5")!)

        
        self.viewControllers = [nav1,nav2,nav3];
        
//        self.tabBar.barTintColor = UIColor.lightGray
        
        
    }

    func setItem(vc:UIViewController,name:String,image:UIImage,selectImage:UIImage) -> Void {
    
        vc.tabBarItem.title = name;
        vc.tabBarItem.image = image.withRenderingMode(UIImageRenderingMode.alwaysOriginal);
        vc.tabBarItem.selectedImage = selectImage.withRenderingMode(UIImageRenderingMode.alwaysOriginal);
        vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.orange,NSAttributedStringKey.font:UIFont.systemFont(ofSize: 14)], for: .selected)
    }


}
