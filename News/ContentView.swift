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
            HStack {
                VStack(alignment: .leading) {
                    Text("Top Headlines").font(.title)
                    Text("Updated just now").font(.callout).foregroundColor(Color.gray)
                }.foregroundColor(Color.white).padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                Spacer()
            }.background(Color.black)
            List(list.items) {
                article in VStack {
                    URLImage(article.imageUrl, content: {
                        $0.image.resizable().aspectRatio(contentMode: .fill)
                    })
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
