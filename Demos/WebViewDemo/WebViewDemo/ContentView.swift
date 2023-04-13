//
//  ContentView.swift
//  WebViewDemo
//
//  Created by Cheng Zhang on 2023/04/13.
//

import SwiftUI
// import SwiftUIKit

struct ContentView: View {
    var body: some View {
      return WebViewWrapper(url: URL(string: "https://www.bluharborbywindsor.com/floorplans/a2-w")!)

//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
