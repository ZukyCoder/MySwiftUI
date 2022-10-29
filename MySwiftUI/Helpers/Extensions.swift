//
//  Extensions.swift
//  MySwiftUI
//
//  Created by Mario Heberthardt on 21/10/2022.
//

import Foundation
import SwiftUI
import CoreImage
import CoreImage.CIFilter

extension DateFormatter {
    static let JSONFormatter:DateFormatter = {
        var format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        return format
    }()
}

//extension UIImage {
//    var averageColor:UIColor? {
//        guard let inputImage = CIImage(image: self) else { return nil }
//        let areaAverage = CIFilter.areaAverage()
//        areaAverage.input
//    }
//}
