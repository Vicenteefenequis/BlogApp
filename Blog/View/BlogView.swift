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
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 350, height: 200)
                         })
                    .padding(.vertical,20)
            } else {
                PlaceholderImageView()
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Divider().frame(height: 1.5).background(Color.black)
                Text(post.title ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 18,weight: .bold))
                Divider().frame(height: 1.5).background(Color.black)
                Text(post.postDescription ?? "N/A")
                    .font(.system(size: 12,weight: .semibold))
            }
        }
    }
}

struct PlaceholderImageView: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(Color.gray)
           
    }
}

struct BlogView_Previews: PreviewProvider {
    static var previews: some View {
        BlogView(post: Blog.dummyData).previewLayout(.sizeThatFits)
    }
}


