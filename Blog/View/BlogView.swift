//
//  ContentView.swift
//  Blog
//
//  Created by Vicente on 21/12/21.
//

import SwiftUI
import URLImage

struct BlogView: View {
    
    let post: Blog

    var body: some View {
        VStack {
            if let imgUrl = post.image,
               let url = URL(string: imgUrl) {
                
                URLImage(url,
                         failure: { error, _ in
                           PlaceholderImageView()
                         },
                         content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth:.infinity)
                         })
            } else {
                PlaceholderImageView()
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Divider().frame(height: 1.5).background(Color.black)
                Text(post.title ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 25,weight: .semibold))
                Divider().frame(height: 1.5).background(Color.black)
                Text(post.postDescription ?? "N/A")
                    .font(.system(size: 18,weight: .light))
                    .lineLimit(3)
            }
        }
    }
}

struct PlaceholderImageView: View {
    var body: some View {
       ProgressView()
    }
}

struct BlogView_Previews: PreviewProvider {
    static var previews: some View {
        BlogView(post: Blog.dummyData).previewLayout(.sizeThatFits)
    }
}


