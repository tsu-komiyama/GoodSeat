//
//  TimeTableBuilder.swift
//  GoodSeat
//
//  Created by Tsukasa Komiyama on 2019/01/12.
//  Copyright © 2019年 Tsukasa Komiyama. All rights reserved.
//

import Foundation

struct TimeTableBuilder {
    static func build() -> TimeTable {
        // 目黒線の平日のみ
        let seven = createRoutes(h: 7,
                                 m: [(1, false, .三田線), (4, false, .南北線), (9, false, .三田線), (12, true, .南北線),
                                      (16, false, .南北線),  (22, false, .三田線), (26, false, .南北線), (28, true, .南北線), (31, false, .南北線),
                                       (33, true, .三田線), (36, false, .三田線), (40, false, .南北線), (43, false, .南北線), (46, true, .三田線),
                                       (48, false, .三田線),  (51, true, .南北線), (54, false, .南北線), (56, true, .三田線), (59, false, .三田線)
                                     ])
        let eight = createRoutes(h: 8,
                                 m: [(1, false, .三田線), (6, false, .南北線), (9, true, .三田線), (11, false, .南北線),
                                     (14, true, .三田線),  (17, false, .三田線), (19, true, .南北線), (22, false, .南北線), (25, true, .三田線),
                                     (29, false, .三田線), (33, false, .三田線), (37, true, .南北線), (39, false, .南北線), (43, false, .三田線),
                                     (47, true, .三田線),  (49, false, .南北線), (52, false, .南北線), (56, true, .三田線), (59, false, .三田線)
            ])
        
        let nine = createRoutes(h: 9, m: [(3, false, .三田線), (7, true, .南北線), (10, false, .三田線), (14, false, .南北線), (19, true, .三田線),
                                           (21, false, .三田線),(25, false, .南北線),(30, true, .三田線),(33, false, .三田線),(40, false, .三田線)])
        var all: [TimeTable.Route] = []
        all.append(contentsOf: seven)
        all.append(contentsOf: eight)
        all.append(contentsOf: nine)
        
        return TimeTable(all: all)
    }
    
    private typealias Hour = Int
    private typealias Min = Int
    
    private static func createRoutes(h: Hour,
                              m: [(Min, Bool, TimeTable.Route.Connection)]) -> [TimeTable.Route] {
        
        var r: [TimeTable.Route] = []
        for (m, e, to) in m {
            let trainType: TimeTable.Route.TrainType = {
                if e {
                    return TimeTable.Route.TrainType.express
                } else {
                    return TimeTable.Route.TrainType.allStation
                }
            }()
            r.append(TimeTable.Route(
                hour: h, minutes: m, connection: to, trainType: trainType))
        }
        return r
    }
    
}
