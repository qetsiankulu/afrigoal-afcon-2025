//
//  TeamsGrid.swift
//  afrigoal-afcon-2025
//
//  Created by Qetsia Nkulu  on 7/6/25.
//

import SwiftUI
import Kingfisher   // use to optimize API calls for te

struct TeamsGrid: View {
    let teams: [Team]
    let textColor: Color
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 30), count: 4) // 4 columns
    
    var body: some View {
        ScrollView {
            // "All Teams" Text
            HStack {
                Text("All teams")
                    .foregroundColor(textColor)
                    .font(Font.custom("OpenSans-SemiBold", size: 16))
                    .padding(.leading, 40)
                    .padding(.top, 20)
                Spacer() // pushes `All teams` to far left
            }
            
            // Grid containing all the teams in the competition 
            LazyVGrid(columns: columns) {
                ForEach(teams) { team in
                    // Flag + Country Name Icon created with VStack
                    VStack {
                        // Display flags making a simple API call to FlagsAPI
                        // KFImage handles caching and efficient loading
                        
                        KFImage(URL(string: "https://flagsapi.com/\(team.countryCode)/flat/64.png"))
                            .placeholder {
                                Circle()
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(width: 48, height: 48)
                            }
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                        

                        // Team name
                        Text(team.name)
                            .foregroundColor(textColor)
                            .font(.custom("OpenSans-SemiBold", size: 13))
                            .frame(height: 3)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 100, height: 90)
                    .padding(.bottom, 20)
                }
            }
            .padding(.horizontal, 47)
            .padding(.bottom, 150)
                    
        }
        
        
    }
}


#Preview {
    SelectTeams()
}

