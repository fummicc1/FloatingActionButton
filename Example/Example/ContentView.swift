//
//  ContentView.swift
//  Example
//
//  Created by Fumiya Tanaka on 2023/01/29.
//

import SwiftUI
import AVFoundation
import FloatingActionButton

struct ContentView: View {
    var body: some View {
        FloatingActionable(
            .bottomTrailing,
            fab: .image(Image(systemName: "plus")),
            color: .red
        ) {
            VStack {
                Text("BottomTrailing FAB")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .padding()
                Button {
                    AudioServicesPlaySystemSound(1001)
                } label: {
                    Text("Tap")
                }
                .foregroundColor(.white)
                .background(Color.red)
                .buttonStyle(.bordered)
                .cornerRadius(16)
                .padding()
            }
        } didPress: {
            AudioServicesPlaySystemSound(1000)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
