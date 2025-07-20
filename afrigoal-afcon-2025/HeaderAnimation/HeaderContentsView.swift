//
//  HeaderContentsView.swift
//  afrigoal-afcon-2025
//
//  Created by Qetsia Nkulu  on 7/11/25.
//
import SwiftUI

struct HeaderContentsView: View {
    @Binding var searchText: String
    let showSkipButton: Bool
    let progress: CGFloat

    var body: some View {
        VStack(spacing: 5) {

            Text("Choose the teams you'd like to follow")
                .foregroundColor(.white)
                .font(Font.custom("Staatliches-Regular", size: 32))
                .fontWeight(.regular)
                .multilineTextAlignment(.leading)
                .navigationBarBackButtonHidden(true) // Hides the back button
                .frame(maxWidth: .infinity, alignment: .leading)
                .opacity(1 - progress)
                .scaleEffect(1 - (0.05 * progress))
                .offset(y: -10 * progress)
                .lineLimit(nil)

            Text("Get instant access to news, upcoming fixtures, and more!")
                .foregroundColor(.white)
                .font(Font.custom("OpenSans-Regular", size: 16))
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .opacity(1 - progress)
                .lineLimit(nil)
                .offset(y: -8 * progress)

            SearchBar(searchText: $searchText)
                .opacity(1 - progress)
                .offset(y: -6 * progress)
        }
        .padding(.horizontal, 25)
        .background(Color("primary-red"))
        .frame(maxWidth: .infinity, maxHeight: 300)
    }
}


#Preview {
    ContentView()
}
       

