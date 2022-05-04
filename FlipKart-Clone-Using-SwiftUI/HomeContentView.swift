//
//  HomeContentView.swift
//  FlipKart-Clone-Using-SwiftUI
//
//  Created by Mac on 30/04/22.
//

import UIKit
import SwiftUI
import CoreData

struct HomeContentView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    NavigationBarContentView()
                    SearchBarContentView()
                }
                .background(AppColor.themeColor)
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarHidden(true)
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
