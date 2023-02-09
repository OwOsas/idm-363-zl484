//
//  LibraryView.swift
//  idm-363-zl484
//
//  Created by Zhengtian Li on 2/8/23.
//

import SwiftUI

struct LibraryView: View {
    var body: some View {
        NavigationView{
            VStack(spacing: 10){
                VStack{
                    HStack{
                        Text("Italian")
                        Spacer()
                    }
                    Palette(colorPalette: [.systemGreen, .white, .red])
                }
                .buttonStyle(.borderedProminent)
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(Color.white)
                    .shadow(color: Color.black.opacity(0.1 ), radius: 5, x: 0, y: 5))
                
                Spacer()
            }
            .padding(20)
            .navigationTitle(Text("Library"))
        }
        .tabItem{
            Image(systemName: "book")
            Text("Library")
            
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}

