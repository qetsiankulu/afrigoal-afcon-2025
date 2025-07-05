//
//  SelectTeams.swift
//  afrigoal-afcon-2025
//
//  Created by Qetsia Nkulu  on 7/5/25.
//

import SwiftUI

struct SelectTeams: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bg-red").ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Header Container
                    VStack(spacing: 20) {
                        // Skip button
                        HStack {
                            Spacer() // pushes `Skip` to far right
                            NavigationLink(destination: TurnOnNotifs()) {
                                Text("Skip")
                                    .font(Font.custom("OpenSans-Regular", size: 16))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 40)
                            }
                        }
                        .padding(.bottom, 20)
                         // Heading
                        Text("Choose the teams you'd like to follow")
                            .foregroundColor(.white)
                            .font(Font.custom("Staatliches-Regular", size: 24))
                            .fontWeight(.regular)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: 360, alignment: .leading)
                            .navigationBarBackButtonHidden(true) // Hides the back button
                        
                        // Description
                        Text("Get instant access to news, upcoming fixtures, and more!")
                            .foregroundColor(.white)
                            .font(Font.custom("OpenSans-Regular", size: 16))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: 360, alignment: .leading)
                                   
                        // Search Teams
                        SearchBar(searchText: $searchText)
                        Spacer() // Pushes content to top of Header container
                    }
                    .padding(.top, 20)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .background(Color("primary-red"))
                    .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 8) // dropshadow
                    
                    // "All Teams" Text
                    HStack {
                        Text("All teams")
                            .font(Font.custom("OpenSans-SemiBold", size: 12))
                            .foregroundColor(.white)
                            .padding(.horizontal, 40)
                    
                        Spacer() // pushes `All teams` to far left
                    }
                    .padding(.top, 20)
                    
                    // 
              
                  
                    
                    Spacer() // Pushes content above to the top of screen
                    
                }
            }
            
        }
    }
}
    

#Preview {
    SelectTeams()
}
