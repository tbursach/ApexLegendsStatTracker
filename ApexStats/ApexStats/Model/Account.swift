//
//  Account.swift
//  ApexStats
//
//  Created by Trevor Bursach on 9/26/20.
//

import Foundation

struct TopLevelDictionary: Decodable {
    let data: SecondLevelDictionary
}

struct SecondLevelDictionary: Decodable {
    
    let segments: [ThirdLevelObject]
    
}

struct ThirdLevelObject: Decodable {
    
    let stats: OverviewStats
    
}

struct OverviewStats: Decodable {
    
    let level: LevelStat
//    let kills: String
//    let killsAsKillLeader: String
//    let damage: String
//    let headshots: String
//    let finishers: String
//    let revives: String
//    let winsWithFullSquad: String
//    let timesPlacedtop3: String
//    let season2Wins: String
//    let rankScore: String
//    let season3Wins: String
//    let season5Wins: String
//    let season5Kills: String
}

struct LevelStat: Decodable {
    let value: Int
    let rank: Int
}


