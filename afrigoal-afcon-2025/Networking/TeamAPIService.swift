//
//  Team.swift
//  afrigoal-afcon-2025
//
//  Created by Qetsia Nkulu  on 7/6/25.
//


import Foundation

struct Team: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let countryCode: String         // ISO country code e.g. "US", "FR", "DE"
}



struct APIResponse: Codable {
    let success: Bool
    let data: [TeamData]
}

struct TeamData: Codable {
    let id: String
    let name: String
    let stadium: String
    let location: String
}


let countryCodeMap: [String: String] = [
    "Morocco": "MA",
    "Burkina Faso": "BF",
    "Cameroon": "CM",
    "Algeria": "DZ",
    "DR Congo": "CD",
    "Senegal": "SN",
    "Egypt": "EG",
    "Angola": "AO",
    "Equatorial Guinea": "GQ",
    "Ivory Coast": "CI",
    "Gabon": "GA",
    "Uganda": "UG",
    "South Africa": "ZA",
    "Tunisia": "TN",
    "Nigeria": "NG",
    "Mali": "ML",
    "Zambia": "ZM",
    "Zimbabwe": "ZW",
    "Comoros": "KM",
    "Sudan": "SD",
    "Benin": "BJ",
    "Tanzania": "TZ",
    "Botswana": "BW",
    "Mozambique": "MZ"
]
