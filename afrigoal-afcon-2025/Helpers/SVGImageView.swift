//
//  SVGImageView.swift
//  afrigoal-afcon-2025
//
//  Created by Qetsia Nkulu  on 7/20/25.
//

import SwiftUI
import Macaw

struct SVGImageView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> MacawView {
        let svgView = MacawView(node: Group(), frame: .zero)
        loadSVG(into: svgView)
        return svgView
    }
    
    func updateUIView(_ uiView: MacawView, context: Context) {}
    
    private func loadSVG(into svgView: MacawView) {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data,
                  let svgString = String(data: data, encoding: .utf8),
                  let node = try? SVGParser.parse(text: svgString) else { return }
            
            DispatchQueue.main.async {
                svgView.node = node
                svgView.contentMode = .scaleAspectFit
                
            }
            
        }.resume()
    }
    
    
}


#Preview {
    SelectTeams()
}

