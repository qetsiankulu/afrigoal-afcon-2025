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
            ZStack {
                MainContentView(viewModel: viewModel)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
        
                if viewModel.isLoading {
                    LoadingOverlayView()
                }
            }
        }
        .ignoresSafeArea(.keyboard)
        .task {
            await viewModel.loadTeams()
        }
    }


}

// MARK: - Main Content
private struct MainContentView: View {
    @ObservedObject var viewModel: SelectTeamsViewModel
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .topTrailing) {
                BackgroundView()
                
                SkipButtonView(showSkip: viewModel.selectedTeams.isEmpty)
                
                TeamsScrollView(
                    teams: viewModel.filteredTeams,
                    searchText: $viewModel.searchText,
                    selectedTeams: $viewModel.selectedTeams
                )
                
                ContinueButtonView(isActive: !viewModel.selectedTeams.isEmpty)
                
            }
        }
    }
}


// MARK: - Subcomponents of Main Content
private struct BackgroundView: View {
    var body: some View {
        Color("bg-red").ignoresSafeArea()
    }
}

private struct SkipButtonView: View {
    let showSkip: Bool
    
    var body: some View {
        if showSkip {
            SkipButton(destination: TurnOnNotifs())
        }
    }
}

private struct TeamsScrollView: View {
    let teams: [Team]
    
    @Binding var searchText: String
    @Binding var selectedTeams: Set<Team>
    
    var body: some View {
        ScalingHeaderScrollView {
            SelectTeamsHeader(searchText: $searchText)
        }
        content: {
            TeamsGrid(
                teams: teams,
                textColor: .white,
                selectedTeams: $selectedTeams
            )
            .padding(.top, 5)
            .padding(.horizontal, 15)
            .animation(.easeInOut, value: teams) // Animates the various teams
        }
        .height(max: 230)
        .height(min: 51)
        .ignoresSafeArea(.all, edges: .top)
        .toolbarBackground(Color("primary-red"), for: .navigationBar) // Match color of header background
        
    }
}

private struct ContinueButtonView: View {
    let isActive: Bool
    
    var body : some View {
        VStack {
            Spacer()
            NavigationButton(
                destination: TurnOnNotifs(),
                text: "Continue",
                isActive: isActive
            )
            .padding(.bottom, 5)
        }
    }
}

private struct LoadingOverlayView: View {
    var body: some View {
        LoadingOverlay()
            .padding(.top, 150)
            .frame(maxWidth: .infinity, maxHeight: .infinity) // fill available space
            .background(Color.black.opacity(0.3)) // optional dimmed background
            .edgesIgnoringSafeArea(.all) // make it cover full screen
            .zIndex(1) // ensure it’s on top
    }
}
    

#Preview {
    SelectTeams()
}
