//
//  SecondDetailView.swift
//  DelivereeApp
//
//  Created by Nurlan Seitov on 17/4/23.
//

import SwiftUI

struct SecondDetailView: View {
    
    var body: some View {
        ZStack {
            Color("Gray")
            VStack(spacing: 20) {
                HStack {
                    VStack {
//                    ScrollView(.vertical, showsIndicators: true) {
                        ListView1()
                        
                        ListView2()
                        Spacer()
                    }
                }
            }
//            .padding(.vertical, 20)
//            .frame(width: 360, height: 500)
            .frame(maxHeight: 500, alignment: .top)
        }
    }
}
        
       

struct SecondDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SecondDetailView()
    }
}

struct CustomText1: View {
    
    var title: String
    var color: Color?
    var weight: Font.Weight?
    var fontStyle:String
    var fontSize: CGFloat
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(color)
                .fontWeight(weight)
                .font(.custom(fontStyle, size: fontSize))
        }
    }
}

struct CustomImage1: View {
    
    var image: Image
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        HStack {
            image
                .resizable()
                .frame(width: width, height: height)
        }
    }
}

struct ListView1: View {
    var body: some View {
        VStack (alignment: .leading) {
            HStack (alignment: .top) {
                CustomText1(
                    title: "Choose delivery location",
                    color: .black, weight: .medium,
                    fontStyle: "Poppins",
                    fontSize: 20)
                
            }
            .padding(.leading)
//            Spacer()
            HStack {
                CustomImage1(
                    image: Image("mappin.and.ellipse"),
                    width: 20,
                    height: 25)
                .foregroundColor(.red)
//                .padding(.leading)
                VStack(alignment: .leading) {
                    CustomText1(title: "Deliver to current location",
                                color: .black, fontStyle: "Poppins-Regular", fontSize: 16)
                    
                    CustomText1(title: "Manas ave", color: .gray,
                                fontStyle: "Poppins-Regular", fontSize: 12)
                    
                }
            }
            .padding(.leading, 40)
            Divider()
                .colorMultiply(Color.gray)
            
            
            HStack {
                CustomImage1(image: Image("mappin"), width: 15, height: 20)
                    .foregroundColor(.red)
//                    .padding(.leading)
                VStack(alignment: .leading) {
                    CustomText1(title: "Deliver to different location",
                                color: .black, fontStyle: "Poppins-Regular", fontSize: 16)
                    
                    CustomText1(title: "Choose location on the map ",
                                color: .gray, fontStyle: "Poppins-Regular", fontSize: 12)
                }
            }
            .padding(.leading, 40)
            Divider()
        }
    }
}

struct ListView2: View {
    var body: some View {
        VStack (alignment: .leading) {
            
            HStack {
                CustomText1(
                    title: "Saved Addresses",
                    color: .black, weight: .medium,
                    fontStyle: "Poppins",
                    fontSize: 20)
                
            }
            .padding()
            
            HStack {
                CustomImage1(image: Image("house"), width: 20, height: 20)
                    .foregroundColor(.blue)
                
                VStack(alignment: .leading) {
                    CustomText1(title: "Home",
                                color: .black, fontStyle: "Poppins-Regular", fontSize: 16)
                    
                    CustomText1(title: "Jukeev-Pudovkin St 43, apt #12",
                                color: .gray, fontStyle: "Poppins-Regular", fontSize: 12)
                }
            }
            .padding(.leading, 40)
            Divider()
            
            HStack {
                CustomImage1(image: Image("briefcase"), width: 20, height: 20)
                    .foregroundColor(.blue)
                
                VStack(alignment: .leading) {
                    CustomText1(title: "Work",
                                color: .black, fontStyle: "Poppins-Regular", fontSize: 16)
                    
                    CustomText1(title: "Manas Ave 32, floor 7, office #703",
                                color: .gray, fontStyle: "Poppins-Regular", fontSize: 12)
                }
            }
            .padding(.leading, 40)
            Divider()
            
            HStack {
                CustomImage1(image: Image("building.2"), width: 20, height: 20)
                    .foregroundColor(.blue)
                
                VStack(alignment: .leading) {
                    CustomText1(title: "Hotel",
                                color: .black, fontStyle: "Poppins-Regular", fontSize: 16)
                    
                    CustomText1(title: "Frunze St 50, floor 10, room #1011 ",
                                color: .gray, fontStyle: "Poppins-Regular", fontSize: 12)
                }
            }
            .padding(.leading, 40)
            Divider()
            
        }
    }
}
