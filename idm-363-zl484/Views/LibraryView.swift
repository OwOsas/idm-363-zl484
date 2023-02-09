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
            Form{
                Section(header: Text("Default Settings")){
                    PaletteView(colorPalette: [.blue, .red, .gray])
                    
                }
                //
            }
        }.tabItem{
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

struct PaletteView: View {
    var colorPalette:[UIColor]
    var body: some View {
        HStack(spacing:0){
            ForEach(colorPalette, id: \.self){color in
                Rectangle()
                //                            .frame(width: 40, height: 40)
                    .aspectRatio(1, contentMode: .fit)
                .overlay(Color(uiColor: color))}
        }
        .mask(
            RoundedRectangle(cornerRadius: 12)
                .fill(.red)
                .frame(
                    minWidth: 0, maxWidth: .infinity, minHeight: 32
                )
        )
        .shadow(color: Color.black.opacity(0.1 ), radius: 5, x: 0, y: 5)
    }
}
