//
//  TimeTable.swift
//  GoodSeat
//
//  Created by Tsukasa Komiyama on 2019/01/12.
//  Copyright © 2019年 Tsukasa Komiyama. All rights reserved.
//


struct TimeTable {
    let all: [Route]
    
    struct Route {
        let hour: Int
        let minutes: Int
        let connection: Connection
        let trainType: TrainType
        
        enum TrainType {
            case allStation
            case express
        }
        
        enum Connection {
            case 三田線
            case 南北線
            case none
            
        }
    }
    
}
