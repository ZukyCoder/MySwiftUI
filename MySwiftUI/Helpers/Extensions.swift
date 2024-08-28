//
//  Extensions.swift
//  MySwiftUI
//
//  Created by Mario Heberthardt on 21/10/2022.
//

import Foundation
import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

extension DateFormatter {
    static let JSONFormatter:DateFormatter = {
        var format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        return format
    }()
}

extension UIImage {
    var averageColor:UIColor? {
        guard let inputImage = CIImage(image: self) else { return nil }
        let areaAverage = CIFilter.areaAverage()
        areaAverage.inputImage = inputImage
        areaAverage.extent = inputImage.extent
        guard let outputImage = areaAverage.outputImage else { return nil }
        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: kCFNull as Any])
        context.render(outputImage,
                       toBitmap: &bitmap,
                       rowBytes: 4,
                       bounds: CGRect(x: 0, y: 0, width: 1, height: 1),
                       format: .RGBA8,
                       colorSpace: nil)
        return UIColor(red: CGFloat(bitmap[0] / 255),
                       green: CGFloat(bitmap[1] / 255),
                       blue: CGFloat(bitmap[2] / 255),
                       alpha: CGFloat(bitmap[3] / 255))
    }
}
