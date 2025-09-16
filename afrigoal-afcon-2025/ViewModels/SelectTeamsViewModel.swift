//
//  SelectTeamsViewModel.swift
//  afrigoal-afcon-2025
//
//  Created by Qetsia Nkulu  on 7/15/25.
//

import Foundation

@MainActor
class SelectTeamsViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var selectedTeams: Set<Team> = []
    @Published var allTeams: [Team] = []
    @Published var isLoading = false
    
    let service = TeamService()
    
    // Filter teams based on input in search bar
    // Two filtering conditions:
    //  1) Team names that search with the search text
    //  2) Team names that contain the search text
    var filteredTeams: [Team] {
        if searchText.isEmpty {
            return allTeams
        } else {
            let lower = searchText.lowercased()
            return allTeams.filter {  team in
                let name = team.name.lowercased()
                return name.hasPrefix(lower) || name.contains(lower)
            }
        }
    }
    
    func loadTeams() async {
        isLoading = true            // Start loading
        do {
            let teams = try await service.fetchTeams()
            self.allTeams = teams
        } catch {
            print("Error fetching teams: \(error)")
        }
        isLoading = false            // Done loading
    }
    
}
