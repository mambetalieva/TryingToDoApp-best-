
//  ContentView.swift
//  TryingToDoApp
//
//  Created by Каира on 18.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    var categories: [Image] = [
        Image(systemName: "car"),
        Image(systemName: "folder"),
        Image(systemName: "pencil"),
        Image(systemName: "house"),
        Image(systemName: "fish"),
        
    ]
    var titleArray: [String] = ["Car","Folder", "Pencil", "House", "Fish"]
    
    @State var select: Int = 0
    
    @State var textFromSearch: String = ""
    
    var body: some View {
       NavigationView(){
               VStack {
                   NavigationLink("Go to next",
                                  destination: SecondScreen())
                       .foregroundColor(.brown)
                       .cornerRadius(10)
                   
                    ZStack {
                        
                        Color("Gray")
                            .ignoresSafeArea(.all)
                        ScrollView (.vertical, showsIndicators: true) {
                            VStack(spacing: 30){
                                NavigationBar()
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(0..<categories.count) { item in
                                            HorizontalSlider(
                                                title: titleArray[item],
                                                image: categories[item],
                                                isSelected: item == select)
                                            .onTapGesture {
                                                select = item
                                            }
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                                
                                SearchView(text: $textFromSearch)
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(0..<3) { item in
                                            
                                            ProductView(image: Image("product\(item)"),
                                                        title: "Tony Roma's ",
                                                        descr: "Ribs & Steaks\nDelivery: FREE • Minimum: $20")
                                            
                                        }
                                        .padding(.trailing)
                                        
                                    }
                                    .padding(.horizontal)
                                }
                            }
                            VStack {
                                HStack (alignment: .top) {
                                    VStack {
                                      
                                        Text("Paul")
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .padding(.bottom)
                                            .navigationTitle("SecondView")
                                        
                                        Text("French Steak\nDelivery: FREE • Minimum: $0")
                                        
                                    }
                                    
                                    Spacer()
                                    
                                    Image("1")
                                        .resizable()
                                        .background(.white)
                                        .cornerRadius(10)
                                        .frame(width: 100, height: 100)
                                        .shadow(color: Color(.black).opacity(0.1), radius: 12, x: 0, y: 2)
                            
                                }
                                .padding(.horizontal)
                                
                                Text("4,5  25 min")
                            }
                            .background(.white)
                            .frame(width: 370, height: 132)
                            .cornerRadius(14)

                        }
                        HStack {
                            TabbarView(image: Image(systemName: "folder")) {
                                print("JDU")
                            }
                            TabbarView(image: Image(systemName: "fish")) {
                                print("JDU")
                            }
                            TabbarView(image: Image(systemName: "pencil")) {
                                print("JDU")
                            }
                            TabbarView(image: Image(systemName: "house")) {
                                print("JDU")
                            }
                            TabbarView(image: Image(systemName: "car")) {
                                print("JDU")
                            }
                        }
                        .padding()
                        .background(.black)
                        .clipShape(Capsule())
                        .padding()
                        .frame(maxHeight: .infinity , alignment: .bottom)
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
    
    struct CustomButton: View {
        var image: Image
        var body: some View {
            Button {
                
            }label: {
                image
            }
        }
    }
    
    
    struct CustomText: View {
        var title: String
        var color: Color?
        var weight: Font.Weight?
        
        var body: some View {
            Text(title)
                .foregroundColor(color)
                .fontWeight(weight)
                .font(.custom("TTNorms-Medium", size: 20))
        }
    }
    
    struct CustomImage: View {
        var image: Image?
        var width: CGFloat?
        var height: CGFloat?
        
        var body: some View {
            image
            //            .resizable()
                .frame(width: width, height: height)
        }
    }
    
    struct NavigationBar: View {
        var body: some View {
            HStack {
                CustomButton(image: Image( "Menu"))
                
                Spacer()
                
                HStack {
                    VStack {
                        CustomText(
                            title: "Delivering to",
                            color: nil,
                            weight: .medium)
                        CustomText(title: "Manas Ave",
                                   color: .black,
                                   weight: .bold)
                    }
                    
                    CustomImage(
                        image: Image("Vector"),
                        width: 10,
                        height: 10)
                }
                
                Spacer()
                
                CustomButton(image: Image("Basket"))
                    
            }
            .padding(.horizontal)
            
        }
    }
    
    struct HorizontalSlider: View {
        var title: String
        var image: Image
        var isSelected: Bool
        
        var body: some View {
            
            HStack {
                CustomImage(image: image)
                    .foregroundColor(isSelected ? .white : .black)
                if isSelected {
                    CustomText(title: title, color: .white)
                    
                }
            }
            .frame(width: 90, height: 50)
            .background(isSelected ? .black: .clear)
            .cornerRadius(20)
            
        }
    }
    
    struct SearchView: View {
        
        @Binding var text: String
        
        var body: some View {
            HStack {
                HStack {
                    CustomImage(image: Image("Search"))
                    
                    TextField("Find restaurant by name", text: $text)
                }
                .padding(.all, 20)
                .background(Color(.white))
                .cornerRadius(10)
                .shadow(color: Color(.black).opacity(0.1), radius: 12, x: 0, y: 2)
                CustomButton(image: Image("Slider3"))
                    .padding()
            }
            .padding(.horizontal)
        }
    }
    
    struct ProductView: View {
        var image: Image
        var title: String
        var descr: String
        var body: some View {
            VStack(alignment: .center) {
                CustomImage(image:  image)
                
                CustomText(title: title,
                           color: .black,
                           weight: .bold)
                
                CustomText(title: descr, 
                           color: .gray,
                           weight: .bold)
                .font(.custom("", size: 10))
            }
            .padding(.all)
            .frame(width: 185)
            .background(.white)
            .cornerRadius(30)
        }
    }
struct TabbarView: View {
    let image: Image
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            image
            .frame(maxWidth: .infinity)
            .padding()
        }
        .foregroundColor(.white)
    }
}

