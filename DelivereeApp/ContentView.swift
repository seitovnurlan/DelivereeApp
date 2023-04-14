//
//  ContentView.swift
//  DelivereeApp
//
//  Created by Nurlan Seitov on 14/4/23.
//

import SwiftUI

//let data: Article = nil

struct ContentView: View {
    
    var categories: [Image] = [
        Image(systemName: "car"),
        Image(systemName: "folder"),
        Image(systemName: "camera"),
        Image(systemName: "house"),
        Image(systemName: "fish"),
    ]
    
    var titleArray: [String] = ["Car", "Folder", "Camera", "House", "Fish"]
    var foodTitle: [String] = ["Tony Roma’s", "Momos", "Paul"]
    var foodDescr: [String] = ["Ribs & Steaks\nDelivery: FREE • Minimum: $20", "Japanese\nDelivery: FREE • Minimum: $10", "French Pasta\nDelivery: FREE • Minimum: $0"]
    
    @State var select: Int = 0
    
    @State var textFromSearch: String = ""
    
    var body: some View {
        ZStack {
            Color("Gray")
                .ignoresSafeArea(.all)
            
            ScrollView(.vertical, showsIndicators: true) {
                VStack(spacing: 30) {
                    NavigationBar()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                        // ForEach(data.title.count)
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
                    HStack {
                       Text("56 stores open")
                    }
                    .padding(.leading)
            
                    
                    SearchView(text: $textFromSearch)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0..<3) { item in
        //                        NavigationLink {
        //                            SecondPage()
        //                        } label: {
                                    ProductView(image: Image("food\(item)"), title: foodTitle[item], descr: foodDescr[item])
        //                        }
                                }
                            .padding(.trailing)
                            }
                        .padding(.horizontal)
                        }
                    
                    HStack {
                        ProductViewSecond(image: Image("food2"), title: foodTitle[2], descr: foodDescr[2])
                    }
                    
                }
            }
            
            HStack {
                TabbarView(image: Image(systemName: "house")) {
                    print("JDU")
                }
                TabbarView(image: Image(systemName: "wallet.pass")) {
                    print("JDU")
                }
                TabbarView(image: Image(systemName: "text.bubble")) {
                    print("JDU")
                }
                TabbarView(image: Image(systemName: "person")) {
                    print("JDU")
                }
            }
            .padding()
            .background(.black)
            .clipShape(Capsule())
            .padding()
            .frame(maxHeight: .infinity, alignment: .bottom)
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
    var color: Color
    var weight: Font.Weight?

    var body: some View {
        Button {
            //
        } label: {
            image
                .foregroundColor(color)
                .fontWeight(weight)
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
    }
}

struct CustomImage: View {
    var image: Image
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
            CustomButton(
                image: Image("line.3.horizontal"),
                color: .black,
                weight: .regular)
            
            Spacer()
            
            HStack {
                VStack {
                    CustomText(
                        title: "Delivering to",
                        color: .gray,
                        weight: .medium)
                    
                    CustomText(
                        title: "Manas Ave",
                        color: .black,
                        weight: .bold
                    )
                }
                CustomImage(
                    image: Image("v.square"),
                    width: 20,
                    height: 20)
            }
            
            Spacer()
            
            CustomButton(image: Image("cart"),
                         color: .black,
                         weight: .regular)
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
                .frame(width: 10, height: 10)
                .foregroundColor(isSelected ? Color.white : Color.black)
           
            if isSelected {
                CustomText(title: title, color: .white)
            }
        }
        .frame(width: 90, height: 50)
        .background(isSelected ? .black : .clear)
        .cornerRadius(20)
    }
}

struct SearchView: View {
    
    @Binding var text: String
    
    var body: some View {
        HStack {
            HStack {
                CustomImage(image: Image("magnifyingglass"))
                    .frame(width: 40,height: 40)
                
                TextField("Find restaurant by name ", text: $text)
            }
            .padding(.all, 10)
            .background(.white)
            //                .frame(maxWidth: .infinity)
            .cornerRadius(10)
            .shadow(color: Color(.black).opacity(0.2), radius: 12, x: 0, y: 2)
            
            //                .padding(.horizontal)
            
            CustomButton(image: Image("slider.horizontal.3"), color: .black)
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
            CustomImage(image: image)
            
            CustomText(
                title: title,
                color: .black,
                weight: .bold)
            
            CustomText(
                title: descr,
                color: .gray,
                weight: .bold)
            .font(.custom("", size: 10))
        }
        .padding(.all)
        .frame(width: 170)
        .background(.white)
        .cornerRadius(30)
    }
}

struct TabbarView: View {
    let image: Image
    let action: () -> Void
    var body: some View {
        Button (action: action) {
            image
                .frame(maxWidth: .infinity)
                .padding()
        }
        .foregroundColor(.white)
    }
}

struct ProductViewSecond: View {
    var image: Image
    var title: String
    var descr: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                CustomText(
                    title: title,
                    color: .black,
                    weight: .bold)
                
                CustomText(
                    title: descr,
                    color: .gray,
                    weight: .bold)
                .font(.custom("", size: 10))
            }
            HStack {
                CustomImage(image: image)
            }
        }
//        .padding(.all)
        .frame(width: 360, height: 140)
        .background(.white)
        .cornerRadius(30)
    }
}
