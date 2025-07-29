//
//  SelectTeams.swift
//  afrigoal-afcon-2025
//
//  Created by Qetsia Nkulu  on 7/5/25.
//

import SwiftUI

struct SelectTeams: View {
    
    @StateObject private var viewModel = SelectTeamsViewModel()
    
    var body: some View {
        // Put the entire view in GeometryReader{} and apply .ignoresSafeArea(.keyboard) modifier to it to prevent keyboard from shifting the enire view up
        GeometryReader { geo in
            
            // Main content
            VStack {
                ZStack {
                    NavigationStack {
                        ZStack {
                            Color("bg-red").ignoresSafeArea()
                            
                            SkipButton(destination: TurnOnNotifs())
                                .padding(.trailing, 35)
                                .padding(.bottom, 720)
                                .zIndex(1000)
                            
                            VStack(spacing: 0) {
                                SelectTeamsHeader(searchText: $viewModel.searchText)
                                
                                // WORKING BUILD
                                TeamsGrid(
                                    teams: viewModel.filteredTeams,
                                    textColor: Color.white,
                                    selectedTeams: $viewModel.selectedTeams
                                )
                                
                            }
                            
                            VStack {
                                Spacer()
                                NavigationButton(
                                    destination: TurnOnNotifs(),
                                    text: "Continue",
                                    isActive: !viewModel.selectedTeams.isEmpty
                                )
                                .padding(.bottom, 5)
                            }
                        }
                    }
                }
                .task {
                    await viewModel.loadTeams()
                }
                
            }
            .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
            
            // Loading overlay that is conditionally shown
            if viewModel.isLoading {
                LoadingOverlay()
            }
        }
        .ignoresSafeArea(.keyboard)
    }


}


    

#Preview {
    SelectTeams()
}
