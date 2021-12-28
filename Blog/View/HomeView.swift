//
//  HomeView.swift
//  Blog
//
//  Created by Vicente on 28/12/21.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.openURL) var openUrl
    @StateObject var viewModel = BlogViewModelImpl(service: BlogServiceImpl())
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .failed(let error):
                ErrorView(error: error, handler: viewModel.getPosts)
            case .success(content: let posts):
                NavigationView {
                    VStack {
                        List(posts) { item in
                            BlogView(post: item)
                                .onTapGesture {
                                    load(url: item.image)
                                }
                        }
                        .onAppear() {
                            UITableView.appearance().backgroundColor = UIColor.clear
                            UITableViewCell.appearance().backgroundColor = UIColor.clear
                        }
                        .refreshable {
                            viewModel.getPosts()
                        }
                    }
                    .padding(.top,10)
                    .navigationBarHidden(true)
                }
            }
        }.onAppear(perform: viewModel.getPosts)
    }
    
    func load(url: String?) {
        guard let link = url,
              let url = URL(string: link) else  { return }
        openUrl(url)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
