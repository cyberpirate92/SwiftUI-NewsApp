//
//  ContentView.swift
//  News
//
//  Created by Ravi Theja on 16/03/20.
//  Copyright © 2020 Idlebrains. All rights reserved.
//

import SwiftUI
import URLImage

extension StringProtocol {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
    var firstCapitalized: String { prefix(1).capitalized + dropFirst() }
}

struct ContentView: View {
    @ObservedObject var list: ListItems = ListItems()
    
    public init() {
        self.list.fetch()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationView {
                List(list.items) {
                    article in NavigationLink(destination: NewsDetailView(article: article)) {
                        VStack {
                            if (article.imageUrl != nil) {
                                URLImage(article.imageUrl!, content: {
                                    $0.image.resizable().aspectRatio(contentMode: .fill)
                                })
                            } else {
                                Image("placeholder-image").resizable().aspectRatio(contentMode: .fill)
                            }
                            VStack(alignment: .leading, spacing: 5) {
                                Text(article.name).font(.headline)
                                Text(article.description).font(.subheadline).foregroundColor(.gray)
                                Spacer()
                            }
                            HStack {
                                Text(article.sourceWebsite ?? "Unknown source").font(.footnote)
                                Spacer()
                                Text(Utils.getFormattedDateString(someDate: article.date)).font(.footnote)
                            }
                            Spacer()
                        }
                    }
                }.navigationBarTitle(Text("Top Headlines"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
