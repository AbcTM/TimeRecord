//
//  RecordItem.swift
//  TimeRecord
//
//  Created by tm on 2018/11/15.
//  Copyright © 2018 tm. All rights reserved.
//

import UIKit

class RecordItem {
    var startTime: Date
    var endTime: Date?
    var interval: TimeInterval?
    var length: TimeInterval = 0
    
    init() {
        self.startTime = Date()
    }
    //MARK: - public
    func calc(preItemRecordItem time: Date) {
        let gp = startTime.timeIntervalSince1970 - time.timeIntervalSince1970
        interval = gp
    }
    
    func end() {
        let tempDate = Date()
        length = tempDate.timeIntervalSince1970 - startTime.timeIntervalSince1970
        endTime = tempDate
    }
}
