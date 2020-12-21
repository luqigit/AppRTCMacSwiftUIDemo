//
//  ContentView.swift
//  AppRTCMacSwiftUIDemo
//
//  Created by luqi on 2020/12/18.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = AppViewModel()
    @State private var roomNumber: String = ""
    @State private var showingAlert = false
    
    var body: some View {
        VStack{
            HStack{
                VideoView(videoTrack: self.viewModel.localVideoTrack,refreshVideoTrack: Binding<Bool>(get: {return self.viewModel.refreshLocalVideoTrack},
                                                                                                      set: { p in self.viewModel.refreshLocalVideoTrack = p}));
                Spacer();
                VideoView(videoTrack: self.viewModel.remoteVideoTrack,refreshVideoTrack: Binding<Bool>(get: {return self.viewModel.refreshRemoteVideoTrack},
                                                                                                      set: { p in self.viewModel.refreshRemoteVideoTrack = p}));
            }
            Spacer();
            Text("信令服务器  " + Config.default.signalingServer);
            Text("ice服务器   " + Config.default.webRTCIceServers[0]);
            HStack{
                TextField("请输入房间号", text: $roomNumber)
                Button(action: {
                    if(self.roomNumber.isEmpty){
                        self.showingAlert = true
                    }else{
                        self.viewModel.connectToRoom(roomID: self.roomNumber)
                    }
                })
                {
                   Text("进入")
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("房间号为空"), message: Text("房间号为空"), dismissButton: .default(Text("Ok")))
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
