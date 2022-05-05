//
//  HomeContentView.swift
//  FlipKart-Clone-Using-SwiftUI
//
//  Created by Mac on 30/04/22.
//

import UIKit
import SwiftUI
import CoreData
import URLImage

class AppConstants {
    static let bannerImageUrl: String = "https://cdn.flipshope.com/blog/wp-content/uploads/2021/09/flipkart-big-bilion-day-1.jpg"
    
}

struct BannerResponse: Identifiable {
    let id: UUID = UUID()
    let url: String
    let name: String
}

struct HomeContentView: View {
    @State var banners: [ BannerResponse ] = [
        BannerResponse(url: AppConstants.bannerImageUrl, name: "1"),
        BannerResponse(url: AppConstants.bannerImageUrl, name: "2"),
        BannerResponse(url: AppConstants.bannerImageUrl, name: "3")
    ]
    
    @State private var selectedBanner = 0
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                VStack {
                    NavigationBarContentView()
                    SearchBarContentView()
                }
                .background(AppColor.themeColor)
                TabView {
                    ForEach(Array(banners.enumerated()), id: \.offset) { index, item in
                        if let url = URL(string: item.url),
                           let imageData = try? Data(contentsOf: url),
                           let image = UIImage(data: imageData) {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .onTapGesture {
                                    print(index)
                                }
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .frame(maxWidth: .infinity, maxHeight: 210)
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarHidden(true)
        }
        .onAppear {
//            for i in 0...Int.random(in: 3...6) {
//                self.banners.append(
//                    BannerResponse (
//                        url: AppConstants.bannerImageUrl,
//                        name: "Banner-\(i+1)"
//                    )
//                )
//            }
        }
    }
}

struct SearchBarContentView: View {
    @State private var searchKeyword: String = ""
    var body: some View {
        TextField(
            "Search for products, Brands and More",
            text: $searchKeyword)
            .background(Color.white)
            .cornerRadius(8)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.bottom, 8)
            .padding(.horizontal, 12)
    }
}

fileprivate struct NavigationBarContentView: View {
    var body: some View {
        HStack {
            NavigationLink(destination: Text("Menu")) {
                Image("menu-white") .renderingMode(.original)
                    .renderingMode(.original)
            }
            
            Image("flipkart-logo")
                .resizable()
                .frame(width: 90)
                .aspectRatio(contentMode: .fit)
            
            Spacer()
            
            NavigationLink(destination: Text("Notification")) {
                Image("bell-ring")
                    .renderingMode(.original)
            }
            
            NavigationLink(destination: Text("Cart")) {
                Image("shopping-cart")
                    .renderingMode(.original)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 30)
        .padding(.top, 12)
        .padding(.bottom, 12)
        .padding(.leading, 12)
        .padding(.trailing, 12)
    }
    
}




/* struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView()
            .environment(\.managedObjectContext,
                          PersistenceController.preview.container.viewContext)
            .previewDevice("iPhone 7")
    }
} */
