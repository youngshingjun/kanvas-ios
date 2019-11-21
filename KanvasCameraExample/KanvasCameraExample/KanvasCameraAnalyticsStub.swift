//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.
//

import AVFoundation
import Foundation
import KanvasCamera

final public class KanvasCameraAnalyticsStub: NSObject, KanvasCameraAnalyticsProvider {

    public func logCameraOpen(mode: CameraMode) {
        logString(string: "logCameraOpen mode:\(modeStringValue(mode))")
    }

    public func logCapturedMedia(type: CameraMode, cameraPosition: AVCaptureDevice.Position, length: TimeInterval, ghostFrameEnabled: Bool, filterType: FilterType) {
        logString(string: "logCapturedMedia type:\(modeStringValue(type)) cameraPosition:\(positionStringValue(cameraPosition)) length:\(format(length)) ghostFrameEnabled:\(ghostFrameEnabled) filterType:\(filterType.key() ?? "null")")
    }

    public func logNextTapped() {
        logString(string: "logNextTapped")
    }

    public func logConfirmedMedia(mode: CameraMode, clipsCount: Int, length: TimeInterval) {
        logString(string: "logConfirmedMedia mode:\(modeStringValue(mode)) clipsCount:\(clipsCount) length:\(format(length))")
    }

    public func logDismiss() {
        logString(string: "logDismiss")
    }

    public func logPhotoCaptured(cameraPosition: String) {
        logString(string: "logPhotoCaptured cameraPosition:\(cameraPosition)")
    }

    public func logGifCaptured(cameraPosition: String) {
        logString(string: "logGifCaptured cameraPosition:\(cameraPosition)")
    }

    public func logVideoCaptured(cameraPosition: String) {
        logString(string: "logVideoCaptured cameraPosition:\(cameraPosition)")
    }

    public func logFlipCamera() {
        logString(string: "logFlipCamera")
    }

    public func logDeleteSegment() {
        logString(string: "logDeleteSegment")
    }

    public func logFlashToggled() {
        logString(string: "logFlashToggled")
    }
    
    public func logImagePreviewToggled(enabled: Bool) {
        logString(string: "logImagePreviewToggled enabled:\(enabled)")
    }
    
    public func logUndoTapped() {
        logString(string: "logUndoTapped")
    }
    
    public func logPreviewDismissed() {
        logString(string: "logPreviewDismissed")
    }

    public func logMovedClip() {
        logString(string: "logMovedClip")
    }
    
    public func logPinchedZoom() {
        logString(string: "logPinchedZoom")
    }
    
    public func logSwipedZoom() {
        logString(string: "logSwipedZoom")
    }

    public func logOpenFiltersSelector() {
        logString(string: "logOpenFiltersSelector")
    }

    public func logFilterSelected(filterType: FilterType) {
        logString(string: "logFilterSelected filterType:\(filterType.key() ?? "null")")
    }

    public func logMediaPickerOpen() {
        logString(string: "logMediaPickerOpen")
    }

    public func logMediaPickerDismiss() {
        logString(string: "logMediaPickerDismiss")
    }

    public func logEditorOpen() {
        logString(string: "logEditorOpen")
    }

    public func logEditorBack() {
        logString(string: "logEditorBack")
    }

    public func logMediaPickerPickedMedia(ofType mediaType: KanvasMediaType) {
        logString(string: "logMediaPickerPickedMedia mediaType:\(mediaType.string())")
    }

    public func logEditorFiltersOpen() {
        logString(string: "logEditorFiltersOpen")
    }

    public func logEditorFilterSelected(filterType: FilterType) {
        logString(string: "logEditorFilterSelected filterType:\(filterType.key() ?? "null")")
    }

    public func logEditorDrawingOpen() {
        logString(string: "logEditorDrawingOpen")
    }

    public func logEditorDrawingChangeStrokeSize(strokeSize: Float) {
        logString(string: "logEditorDrawingChangeStrokeSize strokeSize:\(format(strokeSize))")
    }

    public func logEditorDrawingChangeBrush(brushType: KanvasBrushType) {
        logString(string: "logEditorDrawingChangeBrush brushType:\(brushType.string())")
    }

    public func logEditorDrawingChangeColor(selectionTool: KanvasColorSelectionTool) {
        logString(string: "logEditorDrawingChangeColor selectionTool:\(selectionTool.string())")
    }

    public func logEditorDrawStroke(brushType: KanvasBrushType, strokeSize: Float, drawType: KanvasDrawingAction) {
        logString(string: "logEditorDrawStroke brushType:\(brushType.string()), strokeSize:\(format(strokeSize)), drawType:\(drawType.string())")
    }

    public func logEditorDrawingUndo() {
        logString(string: "logEditorDrawingUndo")
    }

    public func logEditorDrawingEraser(brushType: KanvasBrushType, strokeSize: Float, drawType: KanvasDrawingAction) {
        logString(string: "logEditorDrawingEraser brushType:\(brushType.string()), strokeSize:\(format(strokeSize)), drawType:\(drawType.string())")
    }

    public func logEditorDrawingConfirm() {
        logString(string: "logEditorDrawingConfirm")
    }

    public func logEditorCreatedMedia(clipsCount: Int, length: TimeInterval) {
        logString(string: "logEditorCreatedMedia clipsCount:\(clipsCount) length:\(format(length))")
    }

    public func logOpenFromDashboard(openAction: KanvasDashboardOpenAction) {
        logString(string: "logOpenFromDashboard openAction:\(openAction.string())")
    }

    public func logDismissFromDashboard(dismissAction: KanvasDashboardDismissAction) {
        logString(string: "logDismissFromDashboard dismissAction:\(dismissAction.string())")
    }

    public func logPostFromDashboard() {
        logString(string: "logPostFromDashboard")
    }

    public func logSaveFromDashboard() {
        logString(string: "logSaveFromDashboard")
    }

    public func logOpenComposeFromDashboard() {
        logString(string: "logOpenComposeFromDashboard")
    }

    public func logEditorTagTapped() {
        logString(string: "logEditorTagTapped")
    }

    public func logIconPresentedOnDashboard() {
        logString(string: "logIconPresentedOnDashboard")
    }

    func logString(string: String) {
        NSLog("\(self): \(string)")
    }

    private func format(_ double: Double) -> Double {
        return round(100 * double) / 100.0
    }

    private func format(_ float: Float) -> Float {
        return round(100 * float) / 100.0
    }

    private func modeStringValue(_ mode: CameraMode) -> String {
        switch mode.group {
        case .gif:
            return "gif"
        case .photo:
            return "photo"
        case .video:
            return "video"
        }
    }

    private func positionStringValue(_ position: AVCaptureDevice.Position) -> String {
        switch position {
        case .back:
            return "rear"
        case .front:
            return "front"
        case .unspecified:
            return "unspecified"
        @unknown default:
            return "unspecified"
        }
    }

}
