//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.
//

struct Device {
    
    // Dimension and scale constants
    static let iPhone4OrLessScreenMaxHeight = 568
    static let iPhone5ScreenHeight = 568
    static let iPhone6ScreenHeight = 667
    static let iPhone6PScreenHeight = 736
    static let iPhoneXScreenHeight = 812
    static let retinaScreenMinScale: CGFloat = 2.0
    
    // Device type
    static let isIPad = UIDevice.current.userInterfaceIdiom == .pad
    static let isIPhone = UIDevice.current.userInterfaceIdiom == .phone
    static let isRetina = UIScreen.main.scale >= retinaScreenMinScale
    
    // Width and height of current device
    static let screenWidth = Int(UIScreen.main.bounds.size.width)
    static let screenHeight = Int(UIScreen.main.bounds.size.height)
    static let screenMaxLength = Int(max(screenWidth, screenHeight))
    static let screenMinLength = Int(min(screenWidth, screenHeight))
    
    // Device model
    static let isIPhone4OrLess = isIPhone && screenMaxLength < iPhone4OrLessScreenMaxHeight
    static let isIPhone5 = isIPhone && screenMaxLength == iPhone5ScreenHeight
    static let isIPhone6 = isIPhone && screenMaxLength == iPhone6ScreenHeight
    static let isIPhone6P = isIPhone && screenMaxLength == iPhone6PScreenHeight
    static let isIPhoneX = isIPhone && screenMaxLength == iPhoneXScreenHeight
}