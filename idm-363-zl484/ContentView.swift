//
//  ContentView.swift
//  Swift Test
//
//  Created by Zhengtian Li on 1/24/23.
//
//Potential Solution



import SwiftUI

struct ContentView: View {
    @State private var colorPalette: [UIColor] = [.white,.yellow,.blue,.orange,.purple, .green, .magenta, .brown]
    
    @State private var selectedImg: UIImage! = UIImage(named: "")
//    {
//        didSet{
//            colorPalette = ExtractColorPalette(UIImg: selectedImg)
//            print("Image Set!!!")
////            guard oldValue != selectedImg else { return }
////            do {
////                colorPalette = ExtractColorPalette(UIImg: selectedImg)
////            } catch {
////                fatalError(error.localizedDescription)
////            }
//        }
//    }
    @State public var paletteCount = 5;
    
    var body: some View {
        TabView{
            
//            VStack{
//                if selectedImg != nil{
//                    Image(uiImage: selectedImg!)
//                        .resizable()
//                        .scaledToFit()
//                }
//                else{
//                    Spacer()
//                    Image(systemName: "photo")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(maxWidth: 64)
//                        .foregroundColor(.gray)
//
//                    Spacer()
//                }
//            }
            
            HomeView(
                colorPalette: self.$colorPalette,
                paletteCount: self.$paletteCount,
                selectedImg: self.$selectedImg
            )
            
            LibraryView()
            
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
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
            .previewDisplayName("iPhone 14 Pro Max")
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8")
    }
}
