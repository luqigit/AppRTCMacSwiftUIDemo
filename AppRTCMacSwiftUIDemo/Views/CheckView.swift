//
//  CheckView.swift
//  AppRTCMacSwiftUIDemo
//
//  Created by luqi on 2020/12/22.
//

import Foundation
import SwiftUI
import Cocoa

struct CheckView: View {
    @State var isChecked:Bool = true
    var title:String
    var disable:Bool = false;
    var onCheck: ((Bool) -> Void)?
    private func toggle(){
        self.isChecked = !isChecked;
        if let call = onCheck {
            call(self.isChecked)
        }
    }
    var body: some View {
        Button(action: toggle){
            if(disable){
                Text("☑️")
            }else{
                Text(isChecked ? "✅" : "❌")
            }
            Text(title);
        }.disabled(disable)
            
        
    }
}
struct CheckView_Previews: PreviewProvider {
    static var previews: some View {
        CheckView(isChecked: true, title: "helloword",disable: true)
    }
}
