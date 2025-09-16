//
//  Team.swift
//  afrigoal-afcon-2025
//
//  Created by Qetsia Nkulu  on 9/16/25.
//


struct Team: Identifiable, Hashable {
    let id: String
    let name: String
    let countryCode: String         // ISO country code e.g. "US", "FR", "DE"
    
    init(name: String, countryCode: String) {
        self.name = name
        self.countryCode = countryCode
        self.id = "\(name)-\(countryCode)" // "DR Congo - CD"
        
    }
}