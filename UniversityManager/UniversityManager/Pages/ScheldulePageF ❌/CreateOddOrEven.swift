//
//  CreateOddOrEven.swift
//  UniversityManager
//
//  Created by Danil Bochkarev on 03.11.2022.
//

import SwiftUI

struct CreateOddOrEven: View {
    
    @State private var hasTitle = true
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundScreen()
                
                VStack(spacing: 20) {
                    //сдедать фон у элемента градиент
                    
                    VStack {
                        Image(systemName: "books.vertical.circle.fill")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 150, height: 150)
                            .foregroundColor(ColorForImage())
                    }
                    
                    
                    VStack {
                        Text("Сейчас вы можете создать \n свое личное расписание")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .frame(width: 305, height: 55)
                            .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .cornerRadius(20)
                            .fontWeight(.bold)
                    }
                    
                    VStack {
                        Text("Выберите какую неделю \n     вы хотите заполнить: ")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .frame(width: 305, height: 55)
                            .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .cornerRadius(20)
                            .fontWeight(.bold)
                    }
                    
                    VStack {
                        Text(" ")
                        .frame(width: 250, height: 5)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.gray, Color.gray]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .cornerRadius(20)
                    }
                    
                    VStack(spacing: 20) {
                        HStack {
                            Text("Хочу заполнить чётную")
                                .font(.system(size: 18))
                                .foregroundColor(.white)
                                .frame(width: 255, height: 45)
                                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                .cornerRadius(20)
                                .fontWeight(.bold)
                            
                            NavigationLink(destination: CreateSchelduleEven(), label: {
                                Image(systemName: "plus")
                                    .font(.system(size: 22))
                                    .foregroundColor(.white)
                                    .frame(width: 45, height: 45)
                                    .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .cornerRadius(20)
                                    .fontWeight(.bold)
                                    .shadow(color: colorTabBarAndIcon(), radius: 4)
                            })
                            
                        }
                        
                        HStack {
                            Text("Хочу заполнить нечётную")
                                .font(.system(size: 18))
                                .foregroundColor(.white)
                                .frame(width: 255, height: 45)
                                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                .cornerRadius(20)
                                .fontWeight(.bold)
                            
                            NavigationLink(destination: CreateSchelduleOdd(), label: {
                                Image(systemName: "plus")
                                    .font(.system(size: 22))
                                    .foregroundColor(.white)
                                    .frame(width: 45, height: 45)
                                    .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .cornerRadius(20)
                                    .fontWeight(.bold)
                                    .shadow(color: colorTabBarAndIcon(), radius: 4)
                            })
                        }
                    }
                }.padding(.bottom, 80)
                
            }
        }
    }
}

struct CreateOddOrEven_Previews: PreviewProvider {
    static var previews: some View {
        CreateOddOrEven()
    }
}
