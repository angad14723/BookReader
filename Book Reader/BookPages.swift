//
//  BookPages.swift
//  Book Reader
//  Created by macbook pro on 26/04/24.
//

import SwiftUI

struct BookPages: View {
    
    @State private var bookPages: [BookPage] = []
    @State private var currentIndex = 0
    
    var body: some View {
        TabView (selection: $currentIndex){
            ForEach(bookPages.indices, id: \.self) { index in
                
                //CardView(bookPages[index])
                PeelEffect (content: {
                    CardView(bookPages[index])
                        .tag(index)
                }, onSwipe: {
                    currentIndex = (currentIndex + 1) % bookPages.count
                }, nextPage: bookPages[(index + 1) % bookPages.count])
            }
        }
        
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .onAppear(perform: {
            for index in 1...4 {
                bookPages.append(.init(assetName: "page\(index)"))
            }
            
            print(bookPages.count)
        })
    }
    
    
    /// Card View
    @ViewBuilder
    func CardView(_ page: BookPage) -> some View {
        GeometryReader {
            let size = $0.size
            ZStack {
                Image(page.assetName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
            }
        }
        .contentShape(Rectangle())
    }
}

#Preview {
    BookPages()
}

