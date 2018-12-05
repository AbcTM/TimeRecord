//
//  RecordTableViewCell.swift
//  TimeRecord
//
//  Created by tm on 2018/11/15.
//  Copyright © 2018 tm. All rights reserved.
//

import UIKit

var ft: DateFormatter = {
    let t = DateFormatter()
    t.timeZone = TimeZone.current
    t.dateFormat = "MM/dd HH:mm:ss"
    return t
}()


class RecordTableViewCell: UITableViewCell {
    @IBOutlet weak var start: UILabel!
    @IBOutlet weak var end: UILabel!
    @IBOutlet weak var length: UILabel!
    @IBOutlet weak var interval: UILabel!
    
    var item: RecordItem! {
        didSet {
            updateContent()
        }
    }
    
    // MARK: - init
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MAKR: -
    func updateContent() {
        start.text = ft.string(from: item.startTime)
        if let endTime = item.endTime {
            end.text = ft.string(from: endTime)
        }else{
            end.text = "-"
        }
        
        length.text = item.length == 0 ? "未结束" : String(format: "%.02f s", item.length)
        if let zinterval = item.interval  {
            interval.text = String(format: "%.02f s", zinterval)
        }else{
            interval.text = "- s"
        }
        
    }
}
