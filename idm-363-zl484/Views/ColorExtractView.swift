//
//  ColorExtractView.swift
//  idm-363-zl484
//
//  Created by Zhengtian Li on 2/2/23.
//

import SwiftUI
import ColorKit

struct ColorExtractView: View {
    private var loadImg:UIImage = UIImage(named: "example")!

    @State private var colorArr:[Color] = []
    
    var body: some View {
        ScrollView{
            VStack{
                let colors = getDominantColor(img: loadImg)
//                Text(colors.description)
                let colorPalette = getColorPalette(ColorFrequencyArray: colors, ArrayCount: getSize(arr: colors))
                HStack{
                    ForEach(colorPalette, id: \.self){color in
                        Rectangle()
                            .frame(width: 30, height: 30)
                            .aspectRatio(1, contentMode: .fit)
                        .overlay(Color(uiColor: color))}
                }
                ForEach(colorPalette, id: \.self){color in
                    Rectangle()
                        .frame(width: 30, height: 30)
                        .aspectRatio(1, contentMode: .fit)
                        .overlay(Color(uiColor: color))
                    Text("\(color.description)")
                }
        //        Text("\(colors[4].frequency)")

                
                Rectangle()
                    .frame(width: 300, height: 300)
                    .aspectRatio(1, contentMode: .fit)
                    .overlay(Color(uiColor: colors[2].color))
        //        self.$colorArr = extractColors(from: CIImage(image: loadImg))
            }
        }
        
    }
    
    func getDominantColor(img:UIImage) -> [ColorFrequency]{
        var currentImage: UIImage! {
            didSet {
                guard oldValue != currentImage else { return }
                do {
                    dominantColors = try currentImage.dominantColorFrequencies()
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
        }
        var dominantColors = [ColorFrequency]()
        currentImage = img
        return dominantColors
    }
    
    func getColorPalette(ColorFrequencyArray arr: [ColorFrequency], ArrayCount count: Int) -> [UIColor]{
        var colorPalette = [UIColor]()
        for i in 0..<count{
            colorPalette += [arr[i].color]
        }
        
        return colorPalette
    }
    
    func getSize(arr:[Any]) -> Int{
        return arr.count
    }
}

struct ColorExtractView_Previews: PreviewProvider {
    static var previews: some View {
        ColorExtractView()
    }
}
