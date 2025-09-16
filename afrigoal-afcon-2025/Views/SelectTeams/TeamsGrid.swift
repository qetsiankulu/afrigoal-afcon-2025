//
//  TeamsGrid.swift
//  afrigoal-afcon-2025
//
//  Created by Qetsia Nkulu  on 7/6/25.
//

import SwiftUI
import UIKit

struct TeamsGrid: View {
    let teams: [Team]
    let textColor: Color
    
    @Binding var selectedTeams: [Team]
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 4) // 4 columns
    
    var body: some View {
        ScrollView {
            // "All Teams" Label
            HStack {
                Text("All teams")
                    .foregroundColor(textColor)
                    .font(Font.custom("OpenSans-SemiBold", size: 16))
                    .padding(.leading, 40)
                    .padding(.top, 15)
                Spacer() // pushes `All teams` to far left
            }
            
            // Grid containing all the teams in the competition 
            LazyVGrid(columns: columns) {
                ForEach(teams) { team in
                    let isSelected = selectedTeams.contains(where: {$0.id == team.id})
                    
                    // Team Icon
                    TeamIcon(team: team, textColor: Color.white, isSelected: isSelected)
                    .onTapGesture {
                        if isSelected {
                            selectedTeams.removeAll() { $0.id == team.id }
                        } else {
                            selectedTeams.append(team)
                        }
                    }
                }
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 150)
        }
        // Dismiss the keyboard when the TeamsGrid is dragged
        .simultaneousGesture(
            DragGesture().onChanged { _ in
                UIApplication.shared.endEditing()
            })
        .onChange(of: selectedTeams) {
                  print("Selected teams:", selectedTeams.map { $0.name })
        }
    }
}
            
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}



#Preview {
    SelectTeams()
}

