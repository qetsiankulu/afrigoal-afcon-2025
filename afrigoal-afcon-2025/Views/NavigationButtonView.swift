//
//  NavigationButton.swift
//  afrigoal-afcon-2025
//
//  Created by Qetsia Nkulu  on 7/6/25.
//

import SwiftUI

// `<Destination: View>` - a generic type parameter that must conform to view
// Lets you pass any SwiftUI view as the navigation target

struct NavigationButton<Destination: View>: View {
    let destination: Destination
    let text: String
    let isActive: Bool

    var body: some View {
        Group {
            if isActive {
                activeView()
            } else {
                inactiveView()
            }
        }
        .padding(.bottom, 20)
    }
    
    @ViewBuilder
    private func activeView() -> some View {
        NavigationLink(destination: destination) {
            Text(text)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 360)
                .background(Color("bttn-active"))
                .cornerRadius(10)
                .padding(.horizontal, 40)
        }
        
    }
    
    @ViewBuilder
    private func inactiveView() -> some View {
        Text(text)
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 360)
            .background(Color("bttn-active"))
            .cornerRadius(10)
            .padding(.horizontal, 40)
            .opacity(0.5)
        
    }
}

// Create a PreviewWrapper for testing
struct PreviewWrapper: View {
    @State private var isActive = true
    
    var body: some View {
        VStack {
            NavigationButton(
                destination: Text("Next Screen"),
                text: "Continue",
                isActive: isActive
            )
            
            Button("Toggle State") {
                isActive.toggle()
            }
        }
    }
}

#Preview {
    PreviewWrapper()
}
