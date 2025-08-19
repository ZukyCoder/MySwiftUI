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

/// Extension that provides access to device-specific UI measurements
extension UIDevice {
    /// Returns the size of the top safe area inset of the current window
    ///
    /// This property accesses the safe area top inset of the key window.
    /// Useful for custom layout adjustments that need to account for the notch or status bar.
    ///
    /// - Returns: The height of the top safe area inset in points, or 0 if unavailable
    static var topInsetSize:CGFloat {
        UIApplication
            .shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene}
            .flatMap { $0.windows}
            .first { $0.isKeyWindow}?
            .safeAreaInsets.top ?? 0
        
    }
    
    /// Returns the size of the bottom safe area inset of the current window
    ///
    /// This property accesses the safe area bottom inset of the key window.
    /// Useful for custom layout adjustments that need to account for the home indicator or bottom bar.
    ///
    /// - Returns: The height of the bottom safe area inset in points, or 0 if unavailable
    static var bottomInsetSize:CGFloat {
        UIApplication
            .shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene}
            .flatMap { $0.windows}
            .first { $0.isKeyWindow}?
            .safeAreaInsets.bottom ?? 0
        
    }
}
