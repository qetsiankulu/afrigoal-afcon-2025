//
//  LoadingOverlay.swift
//  afrigoal-afcon-2025
//
//  Created by Qetsia Nkulu  on 7/18/25.
//

import SwiftUI

struct LoadingOverlay : View {
//  var backgroundColor : Color = Color.black.opacity(0.4)      // Overlay background color
    var boxColor : Color = Color("bg-red").opacity(0.7)         // Background for the loading box
    var loadingtext: String = "Loading.."
    var progressTint: Color = .white
    
    
    
    var body: some View {
        ZStack {
//            backgroundColor.ignoresSafeArea()                 // Adds color to background
            VStack(spacing: 10){
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: progressTint))
                    .scaleEffect(1.5)
                Text(loadingtext)
                    .foregroundColor(progressTint)
                    .font(Font.custom("OpenSans-Regular", size: 16))
            }
            .padding()
            .background(boxColor)
            .cornerRadius(10)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

}

#Preview {
    
    LoadingOverlay()
}
