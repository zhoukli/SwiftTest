//
//  HomeController.swift
//  SwiftTest
//
//  Created by 周凯丽 on 2018/4/16.
//  Copyright © 2018年 周凯丽. All rights reserved.
//

import UIKit
import MJRefresh

class HomeController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var dataArray = NSMutableArray();
    var tableView:UITableView?;
    let header = MJRefreshNormalHeader()// 顶部刷新
    let footer = MJRefreshAutoNormalFooter()// 底部刷新
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页";
       
        tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.plain)
        tableView?.delegate = self as UITableViewDelegate
        tableView?.dataSource = self as UITableViewDataSource
        self.view.addSubview(tableView!)
        
        tableView?.register(UINib(nibName: "HomeCell", bundle: nil), forCellReuseIdentifier: "cellInfo")

//        tableView?.register(HomeCell.classForCoder(), forCellReuseIdentifier: "cellInfo")
        tableView?.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        header.lastUpdatedTimeLabel.isHidden = true;
        header.setTitle("正在刷新", for: .refreshing)
        header.setTitle("下拉刷新", for: .idle)
        header.setTitle("松开刷新", for: .pulling)

        header.setRefreshingTarget(self, refreshingAction:#selector(refresh))
        footer.setRefreshingTarget(self, refreshingAction: #selector(loadMore))
        tableView?.mj_header = header;
        tableView?.mj_footer  = footer;
        
        tableView?.estimatedRowHeight = 44.0
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.mj_header.beginRefreshing()
        
    }
    @objc public func refresh() -> Void{
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.dataArray.removeAllObjects()
            var i  = 0
            for i in 0...5{
                self.dataArray.add("0")
            }
            self.tableView?.reloadData()
            self.tableView?.mj_header.endRefreshing();
        }
    }
    @objc public func loadMore() ->Void{
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            var i  = 0
            for i in 0...5{
                self.dataArray.add("0")
            }
            self.tableView?.reloadData()
            self.tableView?.mj_footer.endRefreshing();
        }
    }
    //MARK: UITableViewDataSource
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (dataArray.count);
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:HomeCell = tableView.dequeueReusableCell(withIdentifier: "cellInfo", for: indexPath) as! HomeCell
//        cell.textLabel?.text = dataArray[indexPath.row] as? String;
        let str = "这是第\(indexPath.row)行数据"
        cell.labl.text = str;
        return cell;
    }
    //MARK:UITableViewDelegate
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
