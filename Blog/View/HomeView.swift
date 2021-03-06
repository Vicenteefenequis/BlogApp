//
//  HomeView.swift
//  Blog
//
//  Created by Vicente on 28/12/21.
//

import SwiftUI

struct HomeView: View {
    
    
    @StateObject var viewModel = BlogViewModelImpl(service: BlogServiceImpl())
    @State private var showMenu: Bool = false
    @State var isFullNewsTapped = false
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .failed(let error):
                ErrorView(error: error, handler: viewModel.getPosts)
            case .success(content: let posts):
                NavigationView {
                    ZStack {
                        VStack {
                            HeaderBlog(showMenu: self.$showMenu)
                            List(posts) { post in
                                BlogView(post: post)
                                
                                NavigationLink(
                                    destination:FullNewsView(post:post),
                                    isActive: $isFullNewsTapped
                                ) {
                                    EmptyView()
                                    
                                }
                                .frame(width: 0, height: 0)
                                .hidden()
                                
                            }
                            .onTapGesture {
                                isFullNewsTapped.toggle()
                            }
                            .onAppear() {
                                UITableView.appearance().backgroundColor = UIColor.clear
                                UITableViewCell.appearance().backgroundColor = UIColor.clear
                            }
                            .refreshable {
                                viewModel.getPosts()
                            }
                        }
                        
                        GeometryReader { _ in
                            HStack {
                                SideMenuView(showMenu: self.$showMenu)
                                    .offset(x: showMenu ? 0 : UIScreen.main.bounds.width)
                                
                            }
                        }
                        
                        
                        
                    }
                    
                    .navigationBarHidden(true)
                    
                }
            }
        }.onAppear(perform: viewModel.getPosts)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct HeaderBlog: View {
    
    @Binding var showMenu: Bool
    
    
    var body: some View {
        VStack {
            Button {
                self.showMenu.toggle()
            } label : {
                Image(systemName: "text.justify")
                    .font(.title)
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            Text("This is where \n we tell stories")
                .font(.system(size: 40))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.top,32)
            
            Divider()
        }
        .padding(.horizontal,20)
        
    }
}
