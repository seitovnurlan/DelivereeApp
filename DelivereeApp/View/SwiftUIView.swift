//
//  SwiftUIView.swift
//  DelivereeApp
//
//  Created by Nurlan Seitov on 21/4/23.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        
        ZStack {
            GeometryReader { proxy in
                let frame = proxy.frame(in: .global)
                Image("Delivbackground")
                    .resizable()
                    .frame(width: frame.size.width,
                           height: frame.size.height)
                
            }
            GeometryReader { proxy in
                BlurView(style: .systemThinMaterial)
            }
        }
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct BlurView: UIViewRepresentable {
    let style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(
            effect: UIBlurEffect(style: style)
        )
        
        return view
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        //do nothing
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
