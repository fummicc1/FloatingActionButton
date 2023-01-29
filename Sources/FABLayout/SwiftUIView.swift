//
//  SwiftUIView.swift
//  
//
//  Created by Fumiya Tanaka on 2023/01/29.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack(spacing: 100) {
      ShadowView(color: .red)
        .shadow(color: .black, radius: 10, x: 0.0, y: -5.0)
      ShadowView(color: .green)
        .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
        .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
      ShadowView(color: .blue)
        .shadow(color: .black, radius: 30, x: 0.0, y: 20.0)
    }
  }
}
struct ShadowView: View {
  var color: Color
  var body: some View {
    RoundedRectangle(cornerRadius: 25.0)
      .fill(color)
      .frame(width: 200, height: 100)
  }
}
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
