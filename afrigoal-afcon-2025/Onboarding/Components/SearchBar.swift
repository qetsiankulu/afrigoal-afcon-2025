//
//  SearchBar.swift
//  afrigoal-afcon-2025
//
//  Created by Qetsia Nkulu  on 7/5/25.
//
import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @FocusState private var isFocused: Bool // Tracks focus state

    var body: some View {
        HStack(spacing: 12) {
            // Magnifying glass icon
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color.gray.opacity(0.7))
                .frame(width: 28, height: 28)
            
            // Text display
            ZStack(alignment: .leading) {
                // Display placeholder text if there is not input
                if searchText.isEmpty {
                    Text("Search teams")
                        .foregroundColor(Color.white.opacity(0.7)) // control placeholder color explicitly
                        .font(.custom("OpenSans-Regular", size: 14))
                }
            
                // Otherwise, display what the user has typed
                TextField("", text: $searchText)                    // Empty placeholder to avoid double text
                    .focused($isFocused)                            // Track focus state
                    .foregroundColor(Color.white.opacity(0.7))
                    .font(.custom("OpenSans-Regular", size: 14))
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }
            
            // Display "X" clear button if there is text in the searchbar
            if !searchText.isEmpty{
                Button(action:  {
                    searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(Color.gray.opacity(0.7))
                }
            }
            
            // Display a "Cancel" button is the user has clicked on the search bar
            if isFocused {
               Button("Cancel") {
                   searchText = ""
                   isFocused = false  // Hide keyboard
               }
               .foregroundColor(Color.white.opacity(0.7))
               .transition(.opacity.combined(with: .move(edge: .trailing)))
               .animation(.easeInOut, value: isFocused)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(Color.black.opacity(0.5))
        .cornerRadius(12)
        .frame(maxWidth: 360)
        
    }
}


