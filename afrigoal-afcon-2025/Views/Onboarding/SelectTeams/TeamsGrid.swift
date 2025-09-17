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
    
    @Binding var selectedTeams: Set<Team>
    
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 4) // 4 columns
    
    var body: some View {
        ScrollView {
            // "All Teams" Label
            TeamsHeader(textColor: textColor)
            
            // Grid containing all the teams in the competition
            LazyVGrid(columns: columns) {
                ForEach(teams) { team in
                    TeamIcon(
                        team: team,
                        textColor: .white,
                        isSelected: selectedTeams.contains(team)    // A TeamIcon is selected if it is in the selectedTeams set
                    ) {
                        toggleSelection(for: team)                  // When a TeamIcon is tapped, toggle the selection
                    }
                }
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 150)
        }
        // Dismiss the keyboard when the TeamsGrid is dragged
        // Print the selected teams to the console
        .dismissKeyboardOnDrag()
        .onChange(of: selectedTeams) { printSelectedTeams()}
    }

    // MARK: - Selection
    // Closure we pass to the TeamIcon to execute when it is tapped
    // If we select TeamIcon and it is in the selectedTeams, remove it from selectedTeams
    // If we select TeamIcon and it is NOT in the selectedTeams, add it to the selectedTeams
    private func toggleSelection(for team: Team) {
        if selectedTeams.contains(team) {
            selectedTeams.remove(team)
        } else {
            selectedTeams.insert(team)
        }
    }
    
    private func printSelectedTeams() {
        print("Selected teams:", selectedTeams.map { $0.name })
    }

}

// MARK: - TeamsHeader
struct TeamsHeader: View {
    let textColor: Color
    
    var body: some View {
        HStack {
            Text("All teams")
                .foregroundColor(textColor)
                .font(Font.custom("OpenSans-SemiBold", size: 16))
                .padding(.leading, 40)
                .padding(.top, 15)
            Spacer() // pushes `All teams` to far left
        }
        
    }
}

// MARK: - Dismiss keyboard modifier
// Adds a drag gesture to any view it is applied to
// Whenever the user drags on the view, the keyboard is dismossed
struct DismissKeyboardOnDrag: ViewModifier {
    func body(content: Content) -> some View {
        content.simultaneousGesture(
            DragGesture().onChanged { _ in
                UIApplication.shared.endEditing() //
            }
        )
    }
}

// Makes it easy to use DismissKeyboardOnDrag modifer
// Calls .dismissKeyboardOnDrag instead of .modifier(DismissKeyboardOnDrag())
extension View {
    func dismissKeyboardOnDrag() -> some View {self.modifier(DismissKeyboardOnDrag())}
}
            
// Dismisses the keyboard
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}



#Preview {
    SelectTeams()
}

