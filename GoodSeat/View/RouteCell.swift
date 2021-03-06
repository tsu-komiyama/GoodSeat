//
//  RouteCell.swift
//  GoodSeat
//
//  Created by Tsukasa Komiyama on 2019/01/12.
//  Copyright © 2019年 Tsukasa Komiyama. All rights reserved.
//

import UIKit

class RouteCell: UITableViewCell {

    @IBOutlet weak var hourRabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    
    @IBOutlet weak var connectionLabel: UILabel!
    
    @IBOutlet weak var trainType: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bind(_ route: TimeTable.Route) {
        hourRabel.text = String("0\(route.hour)".suffix(2))
        minLabel.text = String("0\(route.minutes)".suffix(2))
        connectionLabel.text = {
            switch route.connection {
            case .三田線:
                return "三田線直通"
            case .南北線:
                return "-"
            case .none:
                return "-"
            }
        }()
        

        switch route.trainType {
        case .allStation:
            trainType.text = "各停"
            trainType.textColor = .black
        case .express:
            trainType.text = "急行"
            trainType.textColor = .red
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
