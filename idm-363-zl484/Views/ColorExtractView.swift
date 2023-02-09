//
//  ColorExtractView.swift
//  idm-363-zl484
//
//  Created by Zhengtian Li on 2/2/23.
//

import SwiftUI
import ColorKit

struct ColorExtractView: View {
    @State private var loadImg:UIImage = UIImage(named: "TestImg_05")!
    
    @State private var colorArr:[Color] = []
    
    var body: some View {
        ScrollView{
            VStack(spacing:16){
                let colorPalette = ExtractColorPalette(UIImg: loadImg)

                HStack(spacing:0){
                    ForEach(colorPalette, id: \.self){color in
                        Rectangle()
//                            .frame(width: 40, height: 40)
                            .aspectRatio(1, contentMode: .fit)
                        .overlay(Color(uiColor: color))}
                }.mask(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.red)
                        .frame(
                            minWidth: 0, maxWidth: .infinity, minHeight: 32
                        )
                        .padding([.bottom, .top], 10))
            }.padding(20)
        }
    }
}

struct ColorExtractView_Previews: PreviewProvider {
    static var previews: some View {
        ColorExtractView()
    }
}
