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
                HStack {
                    
                    NavigationLink(destination: Text("Menu")) {
                        Image("menu-white") .renderingMode(.original)
                            .renderingMode(.original)
                    }
                    .padding(.leading, 15)
                    
                    Image("flipkart-logo")
                        .resizable()
                        .frame(width: 90, height: 30)
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
                    .padding(.trailing, 15)
                }
                .frame(maxWidth: .infinity, maxHeight: 45)
                .background(AppColor.themeColor)
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarHidden(true)
        }
        
        
    }
    
    func menuButtonTapped() {
        print("Hi")
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
