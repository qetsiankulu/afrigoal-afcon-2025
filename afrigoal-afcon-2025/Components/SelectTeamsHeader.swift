//
//  Header.swift
//  afrigoal-afcon-2025
//
//  Created by Qetsia Nkulu  on 7/7/25.
//

import SwiftUI

struct Header: View {
    @Binding var searchText: String
    var body: some View {
        VStack(spacing: 5) {
       
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
        .padding(.top, 30)
        .background(Color("primary-red"))
        .frame(maxWidth: .infinity, maxHeight: 230)
        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 8)
    }
    
}

#Preview {
    SelectTeams()
}
