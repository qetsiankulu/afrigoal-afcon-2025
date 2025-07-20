//
//  SelectTeams.swift
//  afrigoal-afcon-2025
//
//  Created by Qetsia Nkulu  on 7/5/25.
//

import SwiftUI

struct SelectTeams: View {
    @State private var searchText = ""
    @State private var selectedTeams: [Team] = []
    @State private var showSkipButton = true
    
    // All teams
    let allTeams = [
        Team(name: "Algeria", countryCode: "DZ"),
        Team(name: "Angola", countryCode: "AO"),
        Team(name: "Benin", countryCode: "BJ"),
        Team(name: "Botswana", countryCode: "BW"),
        Team(name: "Burkina Faso", countryCode: "BF"),
        Team(name: "Cameroon", countryCode: "CM"),
        Team(name: "Comoros", countryCode: "KM"),
        Team(name: "Côte d'Ivoire", countryCode: "CI"),
        Team(name: "DR Congo", countryCode: "CD"),
        Team(name: "Egypt", countryCode: "EG"),
        Team(name: "Equatorial Guinea", countryCode: "GQ"),
        Team(name: "Gabon", countryCode: "GA"),
        Team(name: "Mali", countryCode: "ML"),
        Team(name: "Morocco", countryCode: "MA"),
        Team(name: "Mozambique", countryCode: "MZ"),
        Team(name: "Nigeria", countryCode: "NG"),
        Team(name: "Senegal", countryCode: "SN"),
        Team(name: "South Africa", countryCode: "ZA"),
        Team(name: "Sudan", countryCode: "SD"),
        Team(name: "Tanzania", countryCode: "TZ"),
        Team(name: "Tunisia", countryCode: "TN"),
        Team(name: "Uganda", countryCode: "UG"),
        Team(name: "Zambia", countryCode: "ZM"),
        Team(name: "Zimbabwe", countryCode: "ZW")
    ]
    
    var filteredTeams: [Team] {
        if searchText.isEmpty {
            return allTeams
        } else {
            return allTeams.filter { $0.name.lowercased().hasPrefix(searchText.lowercased())}
        }
    }
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bg-red").ignoresSafeArea()
                    
                VStack(spacing: 0) {
                    
                    Header(searchText: $searchText)
                  
                    TeamsGrid(teams: filteredTeams,
                                  textColor: Color.white,
                                  selectedTeams: $selectedTeams)
                    }
                    
                    // Continue button
                    VStack {
                        Spacer()
                        NavigationButton(destination: TurnOnNotifs(), text: "Continue", isActive: !selectedTeams.isEmpty)
                                .padding(.bottom, 5)
                    }
                }
                .ignoresSafeArea(.keyboard) // disables keyboard pushing Continue button up
                
            }
        }
    }
        


    

#Preview {
    SelectTeams()
}
