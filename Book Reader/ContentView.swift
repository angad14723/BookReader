//
//  ContentView.swift
//  Book Reader
//
//  Created by macbook pro on 26/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            ZStack(content: {
//                LinearGradient(colors: [.gray.opacity(0.5), .secondary.opacity(0.3)],
//                               startPoint: .topTrailing,
//                               endPoint: .bottomLeading)
//                .ignoresSafeArea()
                
                VStack{
                    BookPages()
                }
            })
            .navigationTitle("The Book")
        }
        
    }
}

#Preview {
    ContentView()
}
