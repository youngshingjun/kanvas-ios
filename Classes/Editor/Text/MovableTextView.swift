//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.
//

import Foundation
import UIKit

/// A TextView wrapped in a UIView that can be rotated, moved and scaled
final class MovableTextView: UIView {
    
    private let innerTextView: UITextView
    
    /// Current rotation angle
    var rotation: CGFloat {
        didSet {
            applyTransform()
        }
    }
    
    /// Current position from the origin point
    var position: CGPoint {
        didSet {
            applyTransform()
        }
    }
    
    /// Current scale factor
    var scale: CGFloat {
        didSet {
            applyTransform()
        }
    }
    
    var options: TextOptions {
        get {
            return innerTextView.options
        }
        set {
            innerTextView.options = newValue
        }
    }
    
    var transformations: ViewTransformations {
        return ViewTransformations(position: position, scale: scale, rotation: rotation)
    }
    
    init(options: TextOptions, transformations: ViewTransformations) {
        self.innerTextView = UITextView()
        self.position = transformations.position
        self.scale = transformations.scale
        self.rotation = transformations.rotation
        super.init(frame: .zero)
        
        setupTextView(options: options)
        applyTransform()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    /// Sets up the inner text view
    ///
    /// - Parameter option: text style options
    private func setupTextView(options: TextOptions) {
        innerTextView.isUserInteractionEnabled = false
        innerTextView.backgroundColor = .clear
        innerTextView.options = options
        innerTextView.add(into: self)
    }
    
    // MARK: - Transforms
    
    /// Updates the scaling, rotation and position transformations
    private func applyTransform() {
        transform = CGAffineTransform(scaleX: scale, y: scale)
            .concatenating(CGAffineTransform(rotationAngle: rotation))
            .concatenating(CGAffineTransform(translationX: position.x, y: position.y))
    }
}
