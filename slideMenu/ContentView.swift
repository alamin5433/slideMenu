//
//  ContentView.swift
//  slideMenu
//
//  Created by Al Amin on 24/5/20.
//  Copyright © 2020 Al Amin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var index = "Home"
    @State private var show = false
    var body: some View {
        ZStack(alignment: .top) {
            VStack{
                HStack(spacing: 15){
                    Image("pic")
                    .resizable()
                    .frame(width: 50, height: 50)
                    
                    VStack(spacing: 12){
                        Text("Sarmin")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Text("New Your, US")
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    
                    Button(action: {
                        withAnimation(.spring()){
                           self.show.toggle()
                        }
                    }) {
                        Image("menudot")
                        .resizable()
                            .renderingMode(.original)
                        .frame(width: 20, height: 20)
                    }
                }
          //  .padding()
                
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 20){
                            
                            ForEach(data, id: \.self){ data in
                                
                                Button(action: {
                                    withAnimation(.spring()){
                                        self.index = data
                                        self.show.toggle()
                                    }
                                    
                                }) {
                                    Text(data)
                                        .foregroundColor(.black)
                                        .font(.title)
                                }
                            }
                            
                        }
                        Spacer()
                    }
               // .padding()
                    .padding(.top, 50)
                }
                Spacer()
            }
            .offset( x: !self.show ? 200 : 0 , y: 0)
            .scaleEffect(!self.show ? 0.8 : 1)
            .padding()
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(Color.black.opacity(0.06))
            .edgesIgnoringSafeArea(.all)
          
            OriginalView(show: self.$show, index: self.$index)
            
            .offset( x: self.show ? 200 : 0 , y: 0)
            .scaleEffect(self.show ? 0.8 : 1)
                .disabled(self.show ? true : false)
            
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HomeView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                ForEach(1...6, id: \.self){ i in
                    Image("p\(i)")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: 250)
                }
            }
        }
    }
}

struct OriginalView: View {
    @Binding var show: Bool
    @Binding var index: String
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    withAnimation(.spring()){
                       self.show.toggle()
                    }
                    
                }) {
                    Image("Menu")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                }
                Spacer()
                Text("Food")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(.black)
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Image("menudot")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                }
            }
            .padding()
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            ZStack{
                HomeView()
                      .opacity(self.index == "Home" ? 1 : 0)
               
                   // .offset(x: self.index == "Home" ? 0 : 200 , y: 0)
                    //.scaleEffect(self.index == "Home" ? 1 : 0.8)
                  OrderView().opacity(self.index == "Orders" ? 1 : 0)
               // .offset(x: self.index == "Orders" ? 0 : 200 , y: 0)
               // .scaleEffect(self.index == "Orders" ? 1 : 0.8)
            }
            
            
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.top)
    }
}

struct OrderView: View {
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Spacer()
                Text("Order")
                Spacer()
            }
            
                .font(.title)
            Spacer()
        }
        .background(Color.white)
    }
}

var data = ["Home","Orders","Wishlist","Saved Cards","Settings","Help"]
