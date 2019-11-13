//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.
//

import AVFoundation
import Foundation
import GLKit

/// Protocol for filters
protocol FilterProtocol: class {

    /// Uses the sampleBuffer's dimensions to initialize framebuffers and pixel buffers.
    func setupFormatDescription(from sampleBuffer: CMSampleBuffer, outputDimensions: CGSize)

    /// Uses the provided format description to initialize framebuffers and pixel buffers.
    func setupFormatDescription(_ inputFormatDescription: CMFormatDescription)

    /// Uses the provided pixelBuffer to render the filter to a new pixel buffer, and returns the new pixel buffer.
    func processPixelBuffer(_ pixelBuffer: CVPixelBuffer?, time: TimeInterval) -> CVPixelBuffer?

    /// Cleans up all resources allocated by the filter.
    func cleanup()

    /// Output format set by setupFormatDescription
    var outputFormatDescription: CMFormatDescription? { get set }

    var transform: GLKMatrix4? { get set }

    var switchInputDimensions: Bool { get set }

}