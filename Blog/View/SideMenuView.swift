//
//  SideMenuView.swift
//  Blog
//
//  Created by Vicente on 23/12/21.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack {
            Text("Settings")
                .font(.title)
                .foregroundColor(.white)
            
            Spacer()
        }
        .padding(32)
        .background(Color.black)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
