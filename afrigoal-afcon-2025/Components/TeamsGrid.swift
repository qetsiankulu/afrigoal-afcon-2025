//
//  TeamsGrid.swift
//  afrigoal-afcon-2025
//
//  Created by Qetsia Nkulu  on 7/6/25.
//

import SwiftUI

struct TeamsGrid: View {
    let teams: [Team]
    let textColor: Color
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 24), count: 4) // 4 columns
    
    var body: some View {
        ScrollView {
            // "All Teams" Text
            HStack {
                Text("All teams")
                    .foregroundColor(textColor)
                    .font(Font.custom("OpenSans-SemiBold", size: 16))
                    .padding(.leading, 20)
                
                
                Spacer() // pushes `All teams` to far left
            }
            LazyVGrid(columns: columns, spacing: 32) {
                ForEach(teams) { team in
                    // Flag + Country Name Icon created with VStack
                    VStack {
                        // Flag
                        Image(team.countryFlag)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 64, height: 64)
                            .clipShape(Circle())
                            .background(Circle().fill(Color.gray.opacity(0.7)))
                        
                        // Team name
                        Text(team.name)
                            .foregroundColor(textColor)
                            .font(.custom("OpenSans-Regular", size: 14))
                    }
                    .frame(width: 90, height: 110)
                    
                }
            }
            .padding()
        }
    }
}


#Preview {
    TeamsGrid(teams: [
        Team(name: "Algeria", countryFlag: "algeria-flag"),
        Team(name: "Angola", countryFlag: "angola-flag"),
        Team(name: "Benin", countryFlag: "benin-flag"),
        Team(name: "Botswana", countryFlag: "botswana-flag"),
        Team(name: "Burkina Faso", countryFlag: "burkinafaso-flag"),
        Team(name: "Cameroon", countryFlag: "cameroon-flag"),
        Team(name: "Comoros", countryFlag: "comoros-flag"),
        Team(name: "Côte d’Ivoire", countryFlag: "ivorycoast-flag"),
        Team(name: "DR Congo", countryFlag: "drc-flag"),
        Team(name: "Egypt", countryFlag: "egypt-flag"),
        Team(name: "Equatorial Guinea", countryFlag: "equatorialguinea-flag"),
        Team(name: "Gabon", countryFlag: "gabon-flag"),
        Team(name: "Mali", countryFlag: "mali-flag"),
        Team(name: "Morocco", countryFlag: "morocco-flag"),
        Team(name: "Mozambique", countryFlag: "mozambique-flag"),
        Team(name: "Nigeria", countryFlag: "nigeria-flag"),
        Team(name: "Senegal", countryFlag: "senegal-flag"),
        Team(name: "South Africa", countryFlag: "southafrica-flag"),
        Team(name: "Sudan", countryFlag: "sudan-flag"),
        Team(name: "Tanzania", countryFlag: "tanzania-flag"),
        Team(name: "Tunisia", countryFlag: "tunisia-flag"),
        Team(name: "Uganda", countryFlag: "uganda-flag"),
        Team(name: "Zambia", countryFlag: "zambia-flag"),
        Team(name: "Zimbabwe", countryFlag: "zimbabwe-flag")
    ], textColor: Color.black)
}
