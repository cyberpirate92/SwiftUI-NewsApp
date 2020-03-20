//
//  NewsDetailView.swift
//  News
//
//  Created by Ravi Theja on 20/03/20.
//  Copyright © 2020 Idlebrains. All rights reserved.
//

import SwiftUI
import URLImage

let exampleArticle = ListItem(articleUrl: "https://www.theverge.com/2020/3/19/21187161/microsoft-directx-12-ultimate-api-release-xbox-series-x-pc-gaming",
                              name: "Microsoft’s DirectX 12 Ultimate unifies graphics tech for PC gaming and Xbox Series X",
                              description: "Bringing a suite of software advancements in gaming graphics onto a single platform",
                              date: Date(),
                              source: "The Verge",
                              body: "Bringing a suite of software advancements in gaming graphics onto a single platform")

struct NewsDetailView: View {
    let article: ListItem
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 20) {
                Text(article.name).font(.largeTitle).lineLimit(nil)
                VStack(alignment: .leading, spacing: 5) {
                    HStack(alignment: .center) {
                        if (article.imageUrl != nil) {
                            URLImage(article.imageUrl!, placeholder: {_ in
                                Image("placeholder-image").resizable().aspectRatio(contentMode: .fit)
                            }, content: {
                                $0.image.resizable().aspectRatio(contentMode: .fit)
                            })
                        } else {
                            Image("placeholder-image").resizable().aspectRatio(contentMode: .fit)
                        }
                    }
                    HStack {
                        Text(article.sourceWebsite ?? "Unknown").font(.footnote).foregroundColor(.gray)
                        Spacer()
                        Text(Utils.getFormattedDateString(someDate: article.date)).font(.footnote).foregroundColor(.gray)
                    }
                }
                Text(article.body ?? article.description).lineLimit(nil).font(.body)
                HStack(alignment: .center) {
                    Button(action: {
                        print("Request to open article \(self.article.articleUrl)")
                        let url: URL? = URL(string: self.article.articleUrl)!
                        guard url != nil else {
                            return
                        }
                        UIApplication.shared.open(url!)
                    }, label: {
                        Text("Read full article")
                    }).disabled(article.articleUrl.isEmpty).padding().frame(maxWidth: .infinity).border(Color.blue).padding()
                }
            }.padding()
            Spacer()
        }
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView(article: exampleArticle)
    }
}
