//
//  Image+Extension.swift
//  MySwiftUI
//
//  Created by Mario Andres Heberthardt Marchant on 19/8/25.
//

import UIKit

/// Extension for UIImage that provides additional functionality
extension UIImage {
    /// Calculates the average color of the entire image
    ///
    /// This property uses Core Image filters to determine the average color across all pixels in the image.
    /// It's useful for generating color schemes or creating visual effects based on the dominant color.
    ///
    /// - Returns: A UIColor representing the average color of the image, or nil if calculation fails
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
