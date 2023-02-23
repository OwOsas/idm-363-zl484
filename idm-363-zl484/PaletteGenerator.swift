//
//  PaletteGenerator.swift
//  idm-363-zl484
//
//  Created by Zhengtian Li on 2/2/23.
//

import Foundation

import CoreImage

func extractColors(from image: CIImage) -> [CIColor] {
    let filter = CIFilter(name: "CIColorCube")!
    filter.setValue(image, forKey: kCIInputImageKey)
    filter.setValue(8, forKey: "inputCubeDimension")

    let data = filter.value(forKey: "outputImage") as! CIImage
    let size = data.extent.size
    let pointer = UnsafeMutableRawPointer.allocate(byteCount: Int(size.width * size.height * 4), alignment: 1)
    let context = CIContext()
    context.render(data, toBitmap: pointer.bindMemory(to: CIColor.self, capacity: Int(size.width * size.height)), rowBytes: Int(size.width * 4), bounds: data.extent, format: .RGBA8, colorSpace: nil)

    var colors: [CIColor] = []
    for y in 0..<Int(size.height) {
        for x in 0..<Int(size.width) {
            let color = pointer.load(fromByteOffset: (y * Int(size.width) + x) * 4, as: CIColor.self)
            colors.append(color)
        }
    }
    print(colors)
    return colors
}
