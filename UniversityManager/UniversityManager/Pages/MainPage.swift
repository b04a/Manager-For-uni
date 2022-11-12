//
//  MainPage.swift
//  UniversityManager
//
//  Created by Danil Bochkarev on 19.10.2022.
//

import SwiftUI
import CoreData

struct MainPage: View {
    var body: some View {
        NavigationView {
            
            ZStack() {
                backgroundScreen()
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            VStack() {
                                Text("")
                                    .frame(width: 260, height: 100)
                                    .font(.system(size: 40, weight: .light))
                            }
                        }
                    }
                
                MainInfo()
            }
            
        } 
    }
}

struct MainInfo : View {
    var body: some View {
        VStack(spacing: 30) {
            
            DayPage()
            WeatherPage()
            NotessPage()
            
        }.padding(.bottom, 50)
    }
}


struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

// MARK: -  Календарь, DONE ✅
struct DayPage: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .frame(width: 350, height: 150)
                .aspectRatio(1.0, contentMode: .fit)
                .cornerRadius(20)
                .shadow(color: colorTabBarAndIcon(), radius: 4)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Календарь 📅")
                    .font(.system(size: 25, weight: .heavy))
                
                Text("\(dateInMainPage())")
                    .font(.system(size: 25, weight: .medium))
                
                Text("\(TimeOfYear())")
                    .font(.system(size: 16, weight: .light))
            }.padding(.trailing, 95)
        }.frame(width: 350, height: 120).padding()
    }
}

// MARK: -  Погода, DONE ✅
struct WeatherPage: View {
    
    let apiCell = ApiCell()
    
    @State var date = ""
    @State var temp = ""
    
    @State var date1 = ""
    @State var temp1 = ""
    
    @State var date2 = ""
    @State var temp2 = ""
    
    @State var date3 = ""
    @State var temp3 = ""
    
    @State var date4 = ""
    @State var temp4 = ""
    
    @State var date5 = ""
    @State var temp5 = ""
    
    @State var date6 = ""
    @State var temp6 = ""
    
    @State var checkLoadWeather = false
    
    var body: some View {
        ZStack {

            VStack {
                
                if checkLoadWeather {
                    HStack {
                        Text("Погода в Казани 🌍")
                            .font(.system(size: 25, weight: .heavy))
                    }
                    .padding(.top, 85)
                    .padding(.trailing, 55)
                    
                    HStack(spacing: 5) {

                        VStack(alignment: .center) {
                            Text("\(date)")
                                .fontWeight(.bold)
                            
                            Text("-")
                            
                            Text("\(temp)°")
                                .font(.system(size: 15))
                                .fontWeight(.medium)
                            
                        }
                        .frame(width: 42,height: 65)
                        .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing).opacity(0.2))
                        .cornerRadius(5)
                        .padding(.bottom, 80)
                        

                        VStack(alignment: .center) {
                            Text("\(date1)")
                                .fontWeight(.bold)
                            
                            Text("-")
                                .fontWeight(.light)
                            
                            Text("\(temp1)°")
                                .font(.system(size: 15))
                                .fontWeight(.medium)
                        }
                        .frame(width: 42,height: 65)
                        .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing).opacity(0.2))
                        .cornerRadius(5)
                        .padding(.bottom, 80)

                        VStack(alignment: .center) {
                            Text("\(date2)")
                                .fontWeight(.bold)
                            
                            Text("-")
                                .fontWeight(.light)
                            
                            Text("\(temp2)°")
                                .font(.system(size: 15))
                                .fontWeight(.medium)
                        }
                        .frame(width: 42,height: 65)
                        .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing).opacity(0.2))
                        .cornerRadius(5)
                        .padding(.bottom, 80)

                        VStack(alignment: .center) {
                            Text("\(date3)")
                                .fontWeight(.bold)
                            
                            Text("-")
                                .fontWeight(.light)
                            
                            Text("\(temp3)°")
                                .font(.system(size: 15))
                                .fontWeight(.medium)
                        }
                        .frame(width: 42,height: 65)
                        .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing).opacity(0.2))
                        .cornerRadius(5)
                        .padding(.bottom, 80)
                        
                        VStack(alignment: .center) {
                            Text("\(date4)")
                                .fontWeight(.bold)
                            
                            Text("-")
                                .fontWeight(.light)
                            
                            Text("\(temp4)°")
                                .font(.system(size: 15))
                                .fontWeight(.medium)
                        }
                        .frame(width: 42,height: 65)
                        .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing).opacity(0.2))
                        .cornerRadius(5)
                        .padding(.bottom, 80)

                        VStack(alignment: .center) {
                            Text("\(date5)")
                                .fontWeight(.bold)
                            
                            Text("-")
                                .fontWeight(.light)
                            
                            Text("\(temp5)°")
                                .font(.system(size: 15))
                                .fontWeight(.medium)
                        }
                        .frame(width: 42,height: 65)
                        .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing).opacity(0.2))
                        .cornerRadius(5)
                        .padding(.bottom, 80)

                        VStack(alignment: .center) {
                            Text("\(date6)")
                                .fontWeight(.bold)
                            
                            Text("-")
                                .fontWeight(.light)
                            
                            Text("\(temp6)°")
                                .font(.system(size: 15))
                                .fontWeight(.medium)
                        }
                        .frame(width: 42,height: 65)
                        .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing).opacity(0.2))
                        .cornerRadius(5)
                        .padding(.bottom, 80)
                    }
                    .frame(width: 350, height: 150)
                    .background(Color.white)
                    .cornerRadius(20)
                    

                } else {
                    VStack {
                        Text("Погода в Казани 🌍")
                            .font(.system(size: 25, weight: .heavy))
                            .padding(.top, 15)
                            .padding(.trailing, 55)
                        
                        Button {
                            
                            apiCell.getPosts { result in
                                
                                date = result.oneDateStr
                                let check = ((result.oneDateTempMax + result.oneDateTempMin) / 2)
                                let j = String(format: "%.1f", check)
                                temp = String(j)
                                
                                date1 = result.twoDateStr
                                let check1 = ((result.twoDateTempMax + result.twoDateTempMin) / 2)
                                let j1 = String(format: "%.1f", check1)
                                temp1 = String(j1)
                                
                                
                                date2 = result.threeDateStr
                                let check2 = ((result.threeDateTempMax + result.threeDateTempMin) / 2)
                                let j2 = String(format: "%.1f", check2)
                                temp2 = String(j2)
                                
                                
                                date3 = result.fourDateStr
                                let check3 = ((result.fourdayDateTempMax + result.fourdayDateTempMin) / 2)
                                let j3 = String(format: "%.1f", check3)
                                temp3 = String(j3)
                                
                                date4 = result.fiveDateStr
                                let check4 = ((result.fiveDateTempMax + result.fiveDateTempMin) / 2)
                                let j4 = String(format: "%.1f", check4)
                                temp4 = String(j4)
                                
                                
                                date5 = result.sixDateStr
                                let check5 = ((result.sixDateTempMax + result.sixDateTempMin) / 2)
                                let j5 = String(format: "%.1f", check5)
                                temp5 = String(j5)
                                
                                
                                date6 = result.sevenDateStr
                                let check6 = ((result.sevenDateTempMax + result.sevenDateTempMin) / 2)
                                let j6 = String(format: "%.1f", check6)
                                temp6 = String(j6)
                                
                            }
                            
                            checkLoadWeather.toggle()
                            
                        } label: {
                            
                            if checkLoadWeather {
                                Text("☁")
                                    .foregroundColor(.red)
                                    .frame(width: 30, height: 30)
                                    .background(Color.green)
                                    .cornerRadius(12)
                            } else {
                                Text("☁")
                                    .foregroundColor(.red)
                                    .frame(width: 30, height: 30)
                                    .background(Color.red)
                                    .cornerRadius(12)
                                    .padding(.bottom, 40)
                            }
                        }
                    }
                    
                }
            }
            .frame(width: 350, height: 150)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: colorTabBarAndIcon(), radius: 4)
        }
    }
}

// MARK: -  Заметки, DONE ✅
struct NotessPage: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var notes : FetchedResults<Notes>
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .frame(width: 350, height: 150)
                .aspectRatio(1.0, contentMode: .fit)
                .cornerRadius(20)
                .shadow(color: colorTabBarAndIcon(), radius: 4)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Заметки 📌")
                    .font(.system(size: 25, weight: .heavy))
                
                HStack {
                    Text("У вас")
                    Text("\(notes.count)").fontWeight(.bold).foregroundColor((numerNotie < 9 ? .green : .yellow)).shadow(color: (notes.count < 9 ? .green : .yellow), radius: 1)
                    Text("\(checkNotie(numerNotie: notes.count))")
                    
                }.font(.system(size: 25, weight: .medium))

                Text("Не забывай их выполнять!")
                    .font(.system(size: 20, weight: .light))
            }.padding(.trailing, 60)
        }.frame(width: 350, height: 120).padding()
    }
}
  


























