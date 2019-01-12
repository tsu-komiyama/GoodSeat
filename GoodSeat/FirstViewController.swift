//
//  FirstViewController.swift
//  GoodSeat
//
//  Created by Tsukasa Komiyama on 2019/01/12.
//  Copyright © 2019年 Tsukasa Komiyama. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var timeTableTable: UITableView!
    
    let timeTable: TimeTable = TimeTableBuilder.build()

    override func viewDidLoad() {
        super.viewDidLoad()
        timeTableTable.delegate = self
        timeTableTable.dataSource = self
        timeTableTable.register(UINib(nibName: "RouteCell", bundle: nil), forCellReuseIdentifier: "route")
        print(timeTable)
    }
}

extension FirstViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.timeTable.all.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "route", for: indexPath) as? RouteCell else { fatalError("cell is not found") }
        cell.bind(timeTable.all[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}

