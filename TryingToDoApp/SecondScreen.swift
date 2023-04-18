//
//  SecondScreen.swift
//  TryingToDoApp
//
//  Created by Каира on 18.04.2023.
//

import SwiftUI
//struct ContentView: View {
//    var body: some View {
//        NavigationView { // Обертываем все представление в NavigationView для добавления навигации
//            VStack {
//                Text("Экран 1")
//                    .font(.largeTitle)
//
//                NavigationLink("Перейти на экран 2", destination: SecondView()) // Создаем ссылку на экран 2
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//                    .padding()
//            }
//        }
//    }
//}

struct SecondScreen: View {
    
    @State var text: String = "Find Information on here"
    
    var body: some View {
        VStack {
            Text("screen 2")
                .font(.title2)
            VStack {

                Spacer()
                HStack {

                    CustomButton(image: Image(systemName: "folder"))
                        .padding()
                   Spacer()
                    VStack {
                        HStack {
                            Spacer()
                            CustomButton(image: Image(systemName: "house"))
                            Spacer()
                         }
                    }
                    VStack {
                        HStack {
                            Spacer()
                            CustomButton(image: Image(systemName: "star"))
                            Spacer()
                        }
                    }
                    VStack {
                        HStack {
                            Spacer()
                            CustomButton(image: Image(systemName: "heart"))
                        
                        }
                    }
                    .padding()
                }

                SearchView(text: $text)
                    Spacer()
                    .padding(.horizontal)

            }
            
           
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            
        }, label: {
            Image(systemName: "chevron.left")
                .imageScale(.large)
        }))
    }
}

    
    struct SecondScreen_Previews: PreviewProvider {
        static var previews: some View {
            SecondScreen()
        }
    }


