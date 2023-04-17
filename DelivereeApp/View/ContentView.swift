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
    @State var showDetailView = false
    @State var textFromSearch: String = ""
    
    var body: some View {
        
            ZStack {
                    Color("Gray")
                        .ignoresSafeArea(.all)
                    
                NavigationView {
                    VStack {
                        
                        NavigationBar()
                        ScrollView(.vertical, showsIndicators: true) {
                                VStack(spacing: 20) {
                                    
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
                                    VStack() {
                                        HStack {
                                            Text("56 stores open")
                                                .font(.custom("Poppins-Regular", size: 16))
                                                .padding(.leading,15)
                                            Spacer()
                                        }
                                    }
                                   
                            
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
                                            .padding(.trailing,10)
                                            }
                                        .padding(.horizontal)
                                        }
                                    
                                    HStack {
                                        ProductViewSecond(image: Image("food2"), title: foodTitle[2], descr: foodDescr[2])
                                    }
                                    
                                }
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
                    .padding(.top, 8)
//                    .frame(width: 320, height: 60)
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
//    var weight: Image.ResizingMode

    var body: some View {
        Button {
            //
        } label: {
            image
                .foregroundColor(color)
                .fontWeight(weight)
//                .scaledToFill()
                .scaledToFit()
        }
    }
}

struct CustomText: View {
    var title: String
    var color: Color?
    var weight: Font.Weight?
    var fontStyle:String
    var fontSize: CGFloat
    
    var body: some View {
        Text(title)
            .foregroundColor(color)
            .fontWeight(weight)
            .font(.custom(fontStyle, size: fontSize))
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
//            .scaledToFit()
//            .scaledToFill()
    }
}

struct NavigationBar: View {
    var body: some View {
        
//        NavigationView {
//        {
            HStack {
                CustomButton(
                    image: Image("line.3.horizontal"),
                    color: .black,
                    weight: .regular)
                
                Spacer()
                
                HStack {
                    NavigationLink {
                        SecondDetailView()}
                label:
                    {
                        VStack {
                            CustomText(
                                title: "Delivering to",
                                color: Color(UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)),
                                weight: .regular,
                                fontStyle: "Poppins-Light",
                                fontSize: 12)
                            
                            CustomText(
                                title: "Manas Ave",
                                color: .black,
                                weight: .medium,
                                fontStyle: "Poppins-Light",
                                fontSize: 16)
                            //                        .onTapGesture {
                            //                        $showDetailView.toggle()
                            //                    }
                        }
                    }
                    CustomImage(
                        image: Image("chevron.down"),
                        width: 20,
                        height: 20)
                }
                
                Spacer()
                
                CustomButton(image: Image("cart"),
                             color: .white,
                             weight: .regular)
                .frame(width: 50, height: 47, alignment: .center)
                .background(.black)
    //            .foregroundColor(.white)
                .cornerRadius(15)
            }
            
            .padding(.horizontal)
//        }
    }
}

struct HorizontalSlider: View {
    
    var title: String
    var image: Image
    var isSelected: Bool
    
    var body: some View {
        HStack {
            CustomImage(image: image)
                .frame(width: 30, height: 50)
                .foregroundColor(isSelected ? .white : .black)
//                .background(isSelected ? Color.white : Color.black)
                .cornerRadius(8)
           
            if isSelected {
                CustomText(title: title,
                           color: .white,
                           fontStyle: "Poppins-Light",
                           fontSize: 12)
            } else {
                CustomText(title: "",
                           color: .white,
                           fontStyle: "Poppins-Light",
                           fontSize: 12)
                
            }
        }
        .frame(width: isSelected ? 90 :  50)
        .frame(height: isSelected ? 55 :  45)
        .background(isSelected ? .black : .white)
        .cornerRadius(20)
        .shadow(color: Color(.black).opacity(0.2), radius: 6, x: 1, y: 5)
        .padding(.horizontal, 5)
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
                    .font(.custom("Poppins-Light", size: 12))
                    
            }
            .padding(.all, 8)
            .background(.white)
            //                .frame(maxWidth: .infinity)
            .cornerRadius(12)
            .shadow(color: Color(.black).opacity(0.2), radius: 3, x: 0, y: 5)
            
            //                .padding(.horizontal)
            
            CustomButton(image: Image(
                "slider.horizontal.3"),
                         color: .black,
                         weight: .medium)
            
//            .resizable()
            .frame(width: 60, height: 60)
            .scaledToFit()
            
                
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
            CustomImage(
                image: image,
                width: 80,
                height: 140)
            
//                .scaledToFill()
//                .scaledToFit()
            
            CustomText(
                title: title,
                color: .black,
                weight: .bold,
                fontStyle: "Poppins-Medium",
                fontSize: 16)
            
            CustomText(
                title: descr,
                color: .gray,
                weight: .ultraLight,
                fontStyle: "Poppins-Thint",
                fontSize: 10)
            HStack {
                Image("star.fill")
                        .foregroundColor(.black)
//                        .frame(width: 3, height: 3)
//                        .scaledToFill()
                    Text("4.5").font(.system(size: 12))
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                    Image("clock")
                    Text("35 Mins")
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
            }
        }
        .padding(.all)
        .frame(width: 170, height: 280)
        .background(.white)
        .cornerRadius(30)
//        .scaledToFit()
        
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
        .cornerRadius(10)
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
                    weight: .bold,
                    fontStyle: "Poppins-Light",
                    fontSize: 16)
                
                CustomText(
                    title: descr,
                    color: .gray,
                    weight: .regular,
                    fontStyle: "Poppins-Thint",
                    fontSize: 10)
                HStack {
                    Image("star.fill")
                            .foregroundColor(.black)
                        Text("4.5").font(.system(size: 12))
                            .foregroundColor(Color.black)
                            .fontWeight(.bold)
                        Image("clock")
                        Text("35 Mins")
                            .font(.system(size: 12))
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                }
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
