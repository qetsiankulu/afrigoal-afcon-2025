//
//  SelectTeams.swift
//  afrigoal-afcon-2025
//
//  Created by Qetsia Nkulu  on 7/5/25.
//

import SwiftUI
import ScalingHeaderScrollView


struct SelectTeams: View {
    
    @StateObject private var viewModel = SelectTeamsViewModel()
    
    var body: some View {
        // Put the entire view in GeometryReader{} and apply .ignoresSafeArea(.keyboard) modifier to it to prevent keyboard from shifting the enire view up
        GeometryReader { geo in
            // Main content
            VStack {
                NavigationStack {
                    ZStack {
                        Color("bg-red").ignoresSafeArea() // Background color 
                        
                        ScalingHeaderScrollView {
                            // Header with fading effect
                            SelectTeamsHeader(searchText: $viewModel.searchText)
                        }
                        content: {
                            // Scrollable Content
                            TeamsGrid(
                                teams: viewModel.filteredTeams,
                                textColor: .white,
                                selectedTeams: $viewModel.selectedTeams
                            )
                            .padding(.top, 5)
                            .padding(.horizontal, 15)
                            .animation(.easeInOut, value: viewModel.filteredTeams) // Animates the various teams
                        }
                        .height(max: 230)
                        .height(min: 60)
                        .ignoresSafeArea(.all, edges: .top)
                        .toolbarBackground(Color("primary-red"), for: .navigationBar) // Match color of header background
                        .toolbar {
                            // Skip Button
                            ToolbarItem(placement: .navigationBarTrailing) {
                                SkipButton(destination: TurnOnNotifs())
                            }
                        }
                     
                        // Continue Button
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
                .task {
                    await viewModel.loadTeams()
                }
                
            }
            .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
            
            // Loading overlay that is conditionally shown
            if viewModel.isLoading {
                LoadingOverlay()
                    .padding(.top, 150)
                    .frame(maxWidth: .infinity, maxHeight: .infinity) // fill available space
                    .background(Color.black.opacity(0.3)) // optional dimmed background
                    .edgesIgnoringSafeArea(.all) // make it cover full screen
                    .zIndex(1) // ensure it’s on top
            }
            
  
        }
        .ignoresSafeArea(.keyboard)
    }


}




    

#Preview {
    SelectTeams()
}
