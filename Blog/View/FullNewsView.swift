//
//  FullNewsView.swift
//  Blog
//
//  Created by Vicente on 02/01/22.
//

import SwiftUI
import URLImage

struct FullNewsView: View {
    
    var post: Blog
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                AsyncImage(url: URL(string: post.image ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: .infinity)
                        .foregroundColor(.white.opacity(0.7))
                        
                }
                .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3),Color(.gray)]),startPoint: .top, endPoint: .bottom))
                
                VStack(spacing: 30) {
                    Text(post.title ?? "")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .bold()
                    
                    HStack {
                        Text("Written By")
                            .font(.footnote)
                        
                        Text("Vicente Nascimento")
                            .font(.footnote)
                            .bold()
                        
                        Spacer()
                        
                        Text("April 04,2020")
                            .font(.footnote)
                        
                    }
                    
                    Divider().frame(height: 1.5).background(Color.black)
                    
                    
                    Text(post.postDescription ?? "N/A")
                    
                }
                .padding()
            }
            .ignoresSafeArea(.container,edges: .top)
            .navigationBarHidden(true)
        }
        .navigationBarItems(leading: Button(action : {
            self.presentationMode.wrappedValue.dismiss()
        }){
            Image(systemName: "arrow.left")
                .foregroundColor(.white)
                .font(.largeTitle)
        })
        .navigationBarBackButtonHidden(true)
    }
    
}




struct FullNewsView_Previews: PreviewProvider {
    static var previews: some View {
        FullNewsView(post: Blog.dummyData)
    }
}
