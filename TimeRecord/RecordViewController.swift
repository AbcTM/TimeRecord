//
//  RecordViewController.swift
//  TimeRecord
//
//  Created by tm on 2018/11/15.
//  Copyright © 2018 tm. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var fuctionBtn: UIButton!
    
    var dataSource: [RecordItem] = []
    var preItem: RecordItem? = nil
    
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVeiw()
    }
    
    // MARK: - action
    @IBAction func fuctionAction(_ sender: UIButton) {
        if !sender.isSelected {
            let item = RecordItem()
            if let preItemEndTime = preItem?.endTime {
                item.calc(preItemRecordItem: preItemEndTime)
            }
            let row = dataSource.count > 0 ? dataSource.count : 0
            dataSource.append(item)
            tableView.insertRows(at: [IndexPath.init(row: row, section: 0)], with: UITableView.RowAnimation.automatic)
            sender.backgroundColor = UIColor.red
        }else{
            dataSource.last?.end()
            preItem = dataSource.last
            let row = dataSource.count > 0 ? dataSource.count-1 : 0
            tableView.reloadRows(at: [IndexPath.init(row: row, section: 0)], with: UITableView.RowAnimation.automatic)
            sender.backgroundColor = UIColor.green
        }
        sender.isSelected = !sender.isSelected
    }
    
    
    // MARK: - ui
    func setupVeiw() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView.init(frame: CGRect.zero)
        tableView.register(UINib.init(nibName: "RecordTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        fuctionBtn.layer.cornerRadius = 30
        fuctionBtn.layer.masksToBounds = true
        fuctionBtn.backgroundColor = UIColor.green
        fuctionBtn.setTitleColor(UIColor.white, for: UIControl.State.selected)
        fuctionBtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        
        fuctionBtn.setTitle("开始", for: UIControl.State.normal)
        fuctionBtn.setTitle("结束", for: UIControl.State.selected)
    }
}


extension RecordViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RecordTableViewCell
        cell.item = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return Bundle.main.loadNibNamed("TopItemView", owner: nil, options: nil)?.first as? TopItemView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
