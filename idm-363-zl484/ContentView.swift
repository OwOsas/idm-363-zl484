//
//  ContentView.swift
//  Swift Test
//
//  Created by Zhengtian Li on 1/24/23.
//
//Potential Solution



import SwiftUI

struct ContentView: View {
    @State private var colorPalette: [UIColor] =
    [.white, .lightGray, .gray , .darkGray,.black]
    @State private var selectedImg: UIImage! = UIImage(named: "")
    @State public var paletteCount = 5;
    @State public var copyFormat = 1
    @State public var formatList = ["HEX", "RGB"]
    
    var body: some View {
        
        TabView{
            HomeView(
                colorPalette: self.$colorPalette,
                paletteCount: self.$paletteCount,
                selectedImg: self.$selectedImg,
                copyFormat: self.$copyFormat
            )
            
//            LibraryView()
            
            SettingView(
                colorPalette: self.$colorPalette,
                paletteCount: self.$paletteCount,
                copyFormat: self.$copyFormat
            )
            
        }
        .accentColor(Color("Button"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            .previewDisplayName("iPhone 14 Pro")
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8")
    }
}
