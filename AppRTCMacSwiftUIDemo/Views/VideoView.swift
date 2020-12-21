//
//  VideoView.swift
//  AppRTCMacSwiftUIDemo
//
//  Created by luqi on 2020/12/18.
//

import SwiftUI
import WebRTC

struct VideoView: NSViewRepresentable {
    let videoTrack: RTCVideoTrack?
    @Binding var refreshVideoTrack: Bool
    //RTCNSGLVideoView
    //RTCMTLNSVideoView
    func makeNSView(context: Context) -> RTCMTLNSVideoView {
        let width = 900.0;
        let height = (width/16) * 9;
        let view = RTCMTLNSVideoView(frame: .zero)
        view.setSize(CGSize(width: width, height: height));
        return view
    }

    func updateNSView(_ view: RTCMTLNSVideoView, context: Context) {
        if(refreshVideoTrack){
            videoTrack?.add(view)
            refreshVideoTrack = false
        }
        
    }
}
