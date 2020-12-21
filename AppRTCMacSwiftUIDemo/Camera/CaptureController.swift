//
//  CaptureController.swift
//  AppRTCMacSwiftUIDemo
//
//  Created by luqi on 2020/12/21.
//

import Foundation
import WebRTC

class CaptureController: NSObject {
    var _videoCapturer:RTCCameraVideoCapturer?

    init(_ rtcCameraVC: RTCCameraVideoCapturer?) {
        super.init();
        _videoCapturer = rtcCameraVC
    }
    
    func startCapture() -> Void {
        guard let videoCaptureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
            else {
                return
        }
        
        let format = self.selectFormatForDevice(device: videoCaptureDevice);
        let fps = self.selectFpsForFormat(format: format);
        
        self._videoCapturer?.startCapture(with: videoCaptureDevice, format: format, fps: fps)
    }
    
    //- (void)stopCapture;
 
    func stopCapture() -> Void {
        self._videoCapturer?.stopCapture();
    }
    
    func selectFpsForFormat(format: AVCaptureDevice.Format) -> Int {
        var maxFramerate: Float64 = 0

        for fpsRange in format.videoSupportedFrameRateRanges {
            maxFramerate = fmax(maxFramerate, fpsRange.maxFrameRate)
        }

        return Int(maxFramerate)
    }
    
    private func selectFormatForDevice(device: AVCaptureDevice) -> AVCaptureDevice.Format {
        let supportedFormats = RTCCameraVideoCapturer.supportedFormats(for: device)
        let resolution : CMVideoDimensions = CMVideoFormatDescriptionGetDimensions(supportedFormats[0].formatDescription)
//        let targetWidth = resolution.width
//        let targetHeight = resolution.height
        let targetWidth :Int32 = 640
        let targetHeight :Int32 = 480
        var selectedFormat: AVCaptureDevice.Format? = nil
        var currentDiff = INT_MAX

        for format in supportedFormats {
            let dimension: CMVideoDimensions = CMVideoFormatDescriptionGetDimensions(format.formatDescription)
            print(dimension)
            let temp1 = abs(targetWidth - dimension.width);
            let temp2 = abs(targetHeight - dimension.height)
            let diff = temp1 + temp2;
            if diff < currentDiff {
                selectedFormat = format
                currentDiff = Int32(diff)
            }
        }
        return selectedFormat!
    }
}
