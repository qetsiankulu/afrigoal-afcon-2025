//
//  TeamAPIService.swift
//  afrigoal-afcon-2025
//
//  Created by Qetsia Nkulu  on 7/6/25.
//


import Foundation

struct APIResponse: Codable {
    let teams: [TeamData]
}

struct TeamData: Codable {
    let id: String
    let name: String
    let stadium: String
    let location: String
}


let countryCodeMap: [String: String] = [
    "Algeria": "DZ",
    "Angola": "AO",
    "Benin": "BJ",
    "Botswana": "BW",
    "Burkina Faso": "BF",
    "Cameroon": "CM",
    "Comoros": "KM",
    "DR Congo": "CD",
    "Egypt": "EG",
    "Equatorial Guinea": "GQ",
    "Gabon": "GA",
    "Ivory Coast": "CI",
    "Mali": "ML",
    "Morocco": "MA",
    "Mozambique": "MZ",
    "Nigeria": "NG",
    "Senegal": "SN",
    "South Africa": "ZA",
    "Sudan": "SD",
    "Tanzania": "TZ",
    "Tunisia": "TN",
    "Uganda": "UG",
    "Zambia": "ZM",
    "Zimbabwe": "ZW"
]


class TeamService {
    func fetchTeams() async throws -> [Team] {
        guard let url = URL(string:"https://afrigoal-backend.onrender.com/afcon/teams") else {
            throw URLError(.badURL)
        }
        
        // Get the data from API call
        let (data, _) = try await URLSession.shared.data(from: url)
        
        // Decode the JSON data
        let decoded = try JSONDecoder().decode(APIResponse.self, from: data)
        
        // Create a list of`Team` objects
        let teams = decoded.teams
            .compactMap() { teamData -> Team? in
                guard let code = countryCodeMap[teamData.name] else { return nil } // assign a countryCode to each team
                return Team(name: teamData.name, countryCode: code)
        }
        .sorted { $0.name < $1.name } // sort teams alphabetically
        
        return teams
    }
}
