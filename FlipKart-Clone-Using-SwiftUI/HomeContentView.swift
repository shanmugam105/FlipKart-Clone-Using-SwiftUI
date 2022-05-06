//
//  HomeContentView.swift
//  FlipKart-Clone-Using-SwiftUI
//
//  Created by Mac on 30/04/22.
//

import UIKit
import SwiftUI
import CoreData

class AppConstants {
    static let bannerImageUrl: String = "https://cdn.flipshope.com/blog/wp-content/uploads/2021/09/flipkart-big-bilion-day-1.jpg"
    
}

struct ImageTitleResponse: Identifiable {
    let id: UUID = UUID()
    let imageUrl: String
    let title: String
    
    init(imageUrl: String, title: String) {
        self.imageUrl = imageUrl
        self.title    = title
    }
}

struct HomeContentView: View {
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                VStack {
                    NavigationBarContentView()
                    SearchBarContentView()
                }
                .background(AppColor.themeColor)
                ScrollView {
                    VStack(spacing: 0) {
                        // Image Slider
                        ImageSliderContentView()
                        .tabViewStyle(PageTabViewStyle())
                        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                        .frame(maxWidth: .infinity, maxHeight: 210)
                        // Special offer
                        OffersGridContentView()
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarHidden(true)
        }
    }
}

struct OffersGridContentView: View {
    @State var screenSize: CGSize = UIScreen.main.bounds.size
    let offerItems: [ ImageTitleResponse ] = [
        // Row 1
        ImageTitleResponse(imageUrl: "offer_1", title: "Offer 1"),
        ImageTitleResponse(imageUrl: "offer_2", title: "Offer 2"),
        ImageTitleResponse(imageUrl: "offer_3", title: "Offer 3"),
        ImageTitleResponse(imageUrl: "offer_4", title: "Offer 4"),
        ImageTitleResponse(imageUrl: "offer_5", title: "Offer 5"),
        // Row 2
        ImageTitleResponse(imageUrl: "offer_1", title: "Offer 1"),
        ImageTitleResponse(imageUrl: "offer_2", title: "Offer 2"),
        ImageTitleResponse(imageUrl: "offer_3", title: "Offer 3"),
    ]

    private var specialOffersGrid: [ GridItem ] {
        let size = (screenSize.width / 4 - 4) - 4
        return [ GridItem(.fixed(size), spacing: 4),
                 GridItem(.fixed(size), spacing: 4),
                 GridItem(.fixed(size), spacing: 4),
                 GridItem(.fixed(size), spacing: 4) ]
    }
    
    var body: some View {
        // Title
        HStack(spacing: 0) {
            Text("Special offers")
                .fontWeight(.bold)
                .padding(8)
            Spacer()
        }
        // GridView
        LazyVGrid(columns: specialOffersGrid, spacing: 8) {
            ForEach(Array(offerItems.enumerated()), id: \.offset) { index, item in
                VStack(spacing: 0) {
                    let width = screenSize.width / 4 - 4
                    Image(item.imageUrl)
                        .resizable()
                        .frame(maxWidth: width, maxHeight: width)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(screenSize.width / 8 - 2)
                    Text(item.title)
                        .fontWeight(.medium)
                        .frame(minHeight: 30)
                        .lineLimit(1)
                    
                }
                .frame(maxWidth: .infinity / 4 - 4, minHeight: screenSize.width / 5 + 30)
                .onTapGesture {
                    print(index)
                }
                
            }
        }
        .padding(8)
    }
}

struct ImageSliderContentView: View {
    @State var banners: [ ImageTitleResponse ] = [
        ImageTitleResponse(imageUrl: AppConstants.bannerImageUrl, title: "1"),
        ImageTitleResponse(imageUrl: AppConstants.bannerImageUrl, title: "2"),
        ImageTitleResponse(imageUrl: AppConstants.bannerImageUrl, title: "3")
    ]
    var body: some View {
        TabView {
            ForEach(Array(banners.enumerated()), id: \.offset) { index, item in
                if let url = URL(string: item.imageUrl),
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
        .frame(height: 210)
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
