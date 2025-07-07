//
//  SelectTeams.swift
//  afrigoal-afcon-2025
//
//  Created by Qetsia Nkulu  on 7/5/25.
//

import SwiftUI

struct SelectTeams: View {
    @State private var searchText = ""
    @FocusState private var isSearchBarFocused: Bool
    
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
        Team(name: "Equat. Guinea", countryCode: "GQ"),
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
                    // Header Container
                    VStack(spacing: 5) {
                        // Skip button
                        HStack {
                            Spacer() // pushes `Skip` to far right
                            NavigationLink(destination: TurnOnNotifs()) {
                                Text("Skip")
                                    .font(Font.custom("OpenSans-Regular", size: 16))
                                    .foregroundColor(.white)
                                    .padding(.trailing, 5)
                            }
                        }
                        
                         // Heading
                        Text("Choose the teams you'd like to follow")
                            .foregroundColor(.white)
                            .font(Font.custom("Staatliches-Regular", size: 32))
                            .fontWeight(.regular)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .navigationBarBackButtonHidden(true) // Hides the back button
                        
                        // Description
                        Text("Get instant access to news, upcoming fixtures, and more!")
                            .foregroundColor(.white)
                            .font(Font.custom("OpenSans-Regular", size: 16))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                                   
                        // Search Teams
                        SearchBar(searchText: $searchText)
                        Spacer() // Pushes content to top of Header container
                    }
                    .padding(.horizontal, 40)
                    .padding(.top, 10)
                    .background(Color("primary-red"))
                    .frame(maxWidth: .infinity, maxHeight: 230)
                    .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 8) // dropshadow
                
                    
                    // Teams in competition
                    TeamsGrid(teams: filteredTeams, textColor: Color.white)
              
                }
                
                // Continue button overlayed at the bottom
                  VStack {
                      Spacer()
                      NavigationButton(destination: TurnOnNotifs(), text: "Continue", isActive: false)
                          .padding(.bottom, 20) // Adjust as needed for safe area
                  }
            }
            .ignoresSafeArea(.keyboard) // disables keyboard pushing Continue button up 
            
        }
    }
}
    

#Preview {
    SelectTeams()
}
