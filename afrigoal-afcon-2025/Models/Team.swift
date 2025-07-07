//
//  Team.swift
//  afrigoal-afcon-2025
//
//  Created by Qetsia Nkulu  on 7/6/25.
//


import Foundation

struct Fixture: Identifiable {
    let id = UUID()
    let opponent: String
    let date: Date
}


struct Team: Identifiable {
    let id = UUID()
    let name: String
    let countryCode: String         // ISO country code e.g. "US", "FR", "DE"
    var fixtures: [Fixture] = []
}
