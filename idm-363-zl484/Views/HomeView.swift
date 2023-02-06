//
//  HomeView.swift
//  idm-363-zl484
//
//  Created by Zhengtian Li on 2/1/23.
//

import SwiftUI
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8")
        
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
            .previewDisplayName("iPhone 14 Pro Max")
    }
}

struct HomeView: View {
    @Binding var colorPalette:[Color]
    @Binding var paletteCount:Int
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(spacing: 24){
                    VStack(spacing: 16){
                        HStack{
                            Text("Generate")
                                .font(.title)
                                .fontWeight(.bold)
                            Spacer ()
                        }
                        
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(.white)
                            .overlay(
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 64)
                                    .foregroundColor(.secondary)
                            )
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .aspectRatio(1.6, contentMode: .fit)
                            .shadow(color: Color.black.opacity(0.1 ), radius: 5, x: 0, y: 5)
                        
                        HStack(spacing: 16){
                            Button{
                                
                            }label: {
                                Spacer()
                                Image(systemName: "folder")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 21)
                                Spacer()
                            }
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                            .buttonStyle(.borderedProminent)
                            
                            Button{
                                
                            }label: {
                                Spacer()
                                Image(systemName: "camera")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 21)
                                Spacer()
                            }
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                            .buttonStyle(.borderedProminent)
                        }
                    }
                    
                    ColorPaletteView(colorPalette: self.$colorPalette, paletteCount: self.$paletteCount)
                    Spacer()
                }
                .padding(20) 
            }
        }
        .tabItem{
            Image(systemName: "house")
            Text("Home")
        }
    }
}
