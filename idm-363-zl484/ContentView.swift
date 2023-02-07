//
//  ContentView.swift
//  Swift Test
//
//  Created by Zhengtian Li on 1/24/23.
//
//Potential Solution
//https://www.hackingwithswift.com/read/13/4/applying-filters-cicontext-cifilter


import SwiftUI

struct ContentView: View {
    @State private var colorPalette: [Color] = [.white,.yellow,.blue,.orange,.purple]
    @State public var paletteCount = 5;
    
    var body: some View {
        TabView{
            HomeView(
                colorPalette: self.$colorPalette,
                paletteCount: self.$paletteCount
            )
            
            SettingView(
                colorPalette: self.$colorPalette,
                paletteCount: self.$paletteCount
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8")

        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
            .previewDisplayName("iPhone 14 Pro Max")
    }
}


