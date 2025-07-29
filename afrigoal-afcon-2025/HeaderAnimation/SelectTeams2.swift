//
//  Home.swift
//  afrigoal-afcon-2025
//
//  Created by Qetsia Nkulu  on 7/11/25.
//


import SwiftUI

struct SelectTeams2: View {
    @State private var searchText = ""
    @State private var selectedTeams: [Team] = []
    @State private var showSkipButton = true
    
    // Team properties
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
    
    var size: CGSize
    var safeArea: EdgeInsets
    /// View Properties
    @State private var offsetY: CGFloat = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bg-red").ignoresSafeArea()
                
                ScrollViewReader { scrollProxy in
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 0) {
                            HeaderView()
                            /// Making to Top
                                .zIndex(1000)
                            
                            TeamsGrid(teams: filteredTeams,
                                      textColor: Color.white,
                                      selectedTeams: $selectedTeams
                            )
                        }
                        .id("SCROLLVIEW")
                        .background {
                            ScrollDetector { offset in
                                offsetY = -offset
                            } onDraggingEnd: { offset, velocity in
                                /// Resetting to Intial State, if not Completely Scrolled
                                let headerHeight = (size.height * 0.3) + safeArea.top
                                let minimumHeaderHeight = 65 + safeArea.top
                                
                                let targetEnd = offset + (velocity * 45)
                                if targetEnd < (headerHeight - minimumHeaderHeight) && targetEnd > 0 {
                                    withAnimation(.interactiveSpring(response: 0.55, dampingFraction: 0.65, blendDuration: 0.65)) {
                                        scrollProxy.scrollTo("SCROLLVIEW", anchor: .top)
                                    }
                                }
                            }
                        }
                    }
                }
//                
//                // Continue button
//                VStack {
//                    Spacer()
//                    NavigationButton(destination: TurnOnNotifs(), text: "Continue", isActive: !selectedTeams.isEmpty)
//                            .padding(.bottom, 10)
//                }
        
        }
    }
        .ignoresSafeArea(.keyboard) // disables keyboard pushing Continue button up
        
    }


    
    
    /// Header View
    @ViewBuilder
    func HeaderView() -> some View {
        let headerHeight = (size.height * 0.3) + safeArea.top
        let minimumHeaderHeight = 20 + safeArea.top
        /// Converting Offset into Progress
        /// Limiting it to 0 - 1
        let progress = max(min(-offsetY / (headerHeight - minimumHeaderHeight), 1), 0)
        GeometryReader { _ in
            ZStack {
//                Rectangle()
//                    .fill(Color("primary-red"))
                
                Color("primary-red")
                       .ignoresSafeArea()
                
                // MARK: Header contents
                HeaderContentsView(searchText: $searchText,
                                   progress: progress)
                .padding(.top, safeArea.top)
            }
            /// Resizing Header
            .frame(height: (headerHeight + offsetY) < minimumHeaderHeight ? minimumHeaderHeight : (headerHeight + offsetY), alignment: .bottom)
            /// Sticking to the Top
            .offset(y: -offsetY)
        }
        .frame(height: headerHeight)
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

