//
//  FirstViewController.swift
//  GoodSeat
//
//  Created by Tsukasa Komiyama on 2019/01/12.
//  Copyright © 2019年 Tsukasa Komiyama. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    let timeTable: TimeTable = TimeTableBuilder.build()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(timeTable)
    }


}

