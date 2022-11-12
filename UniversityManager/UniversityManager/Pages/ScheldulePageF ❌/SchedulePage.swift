//
//  SchedulePage.swift
//  UniversityManager
//
//  Created by Danil Bochkarev on 31.10.2022.
//

import SwiftUI

var checkWeekPage = oddEvenWeekCheck()

struct SchedulePage: View {
    var body: some View {
        NavigationView {
            ZStack {
                backgroundScreen()
                
                    .navigationTitle(Text("Расписание 📚"))
                
                VStack(spacing: 20) {
                    HStack {
                        Text("Данная неделя : \(oddEvenWeekCheck())")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                            .frame(width: 305, height: 45)
                            .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .cornerRadius(20)
                            .fontWeight(.bold)
                        
                        NavigationLink(destination: CreateOddOrEven(), label: {
                            Image(systemName: "plus")
                                .font(.system(size: 22))
                                .foregroundColor(.white)
                                .frame(width: 45, height: 45)
                                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                .cornerRadius(20)
                                .fontWeight(.bold)
                            
                        })
                    }.padding(.top, 30)
                    
                    
                    List {
                            Monday()
                            Tuesday()
                            Wednesday()
                            Thursday()
                            Friday()
                            Saturday()
                            Sunday()
                        }
                        .listRowBackground(Color.red.opacity(0))
                        .shadow(color: colorTabBarAndIcon(), radius: 4)
                }
            }
            .scrollContentBackground(.hidden)
        }
    }
}

struct SchedulePage_Previews: PreviewProvider {
    static var previews: some View {
        SchedulePage()
    }
}

struct Monday : View {
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.white)
                .frame(width: 340, height: 210)
                .aspectRatio(1.0, contentMode: .fit)
            
            VStack {
                
                VStack(alignment: .center) {

                    Text("Понедельник")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    
                    Text("")
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        
                        Text("Занятия отсуствуют")
                    }
                    
                    
                }
                .frame(width: 340, height: 130)
                .fontWeight(.light)
                .padding(.bottom, 15)
            }
            
        }.listRowBackground(Color.red.opacity(0))
    }
}

struct Tuesday : View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.white)
                .frame(width: 340, height: 210)
                .aspectRatio(1.0, contentMode: .fit)
            
            VStack {
                
                VStack(alignment: .center) {

                    Text("Вторник")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    
                    Text("")
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("1.").fontWeight(.bold)
                        
                        Text("8:00 - 9:30")
                        //checkWeekPage == "Нечёт" ? "Физка" : "Алгебра"
                        Text("Черчение")
                        
                        Text("- лаб")
                        
                        Text("- Д506")
                    }
                    
                    HStack {
                        Text("2.").fontWeight(.bold)
                        
                        Text("9:40 - 11:10")
                        
                        Text("- \(checkWeekPage == "Нечёт" ? "Инфа" : "МВ")")
                        
                        Text("- пр")
                        
                        Text("- \(checkWeekPage == "Нечёт" ? "Д520" : "Е226")")
                    }
                    
                    HStack {
                        Text("3.").fontWeight(.bold)
                        
                        Text("11:20 - 12:50")
                        
                        Text("- \(checkWeekPage == "Нечёт" ? "История" : "МВ")")
                        
                        Text("- пр")
                        
                        Text("- \(checkWeekPage == "Нечёт" ? "Д104а" : "Е226")")
                    }
                    
                    HStack {
                        Text("4.").fontWeight(.bold)
                        
                        Text("13:00 - 14:30")
                        
                        Text("")
                        
                        Text("")
                    }
                    
                    HStack {
                        Text("5.").fontWeight(.bold)
                        
                        Text("14:40 - 16:10")
                        
                        Text("- Физра")
                        
                        Text(" ")
                    }
                    
                    HStack {
                        Text("6.").fontWeight(.bold)
                        
                        Text("16:20 - 17:50")
                        
                        Text("")
                        
                        Text("")
                    }
                    
                    HStack {
                        Text("7.").fontWeight(.bold)
                        
                        Text("18:00 - 19:30")
                        
                        Text("")
                        
                        Text("")
                    }
                }
                .frame(width: 340, height: 130)
                .fontWeight(.light)
                .padding(.bottom, 15)
            }
            
        }.listRowBackground(Color.red.opacity(0))
    }
}

struct Wednesday : View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.white)
                .frame(width: 340, height: 210)
                .aspectRatio(1.0, contentMode: .fit)
            
            VStack {
                
                VStack(alignment: .center) {

                    Text("Среда")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    
                    Text("")
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("1.").fontWeight(.bold)
                        
                        Text("8:00 - 9:30")
                        
                        Text("")
                        
                        Text("")
                    }
                    
                    HStack {
                        Text("2.").fontWeight(.bold)
                        
                        Text("9:40 - 11:10")
                        
                        Text("- \(checkWeekPage == "Нечёт" ? "СОКР" : "История")")
                        
                        Text("- лек")
                        
                        Text("- \(checkWeekPage == "Нечёт" ? "хз" : "Л217")")
                    }
                    
                    HStack {
                        Text("3.").fontWeight(.bold)
                        
                        Text("11:20 - 12:50")
                        
                        Text("- \(checkWeekPage == "Нечёт" ? "ВМ" : "МВ")")
                        
                        Text("- лек")
                        
                        Text("- \(checkWeekPage == "Нечёт" ? "Л217" : "Е226")")
                    }
                    
                    HStack {
                        Text("4.").fontWeight(.bold)
                        
                        Text("13:00 - 14:30")
                        
                        Text("- \(checkWeekPage == "Нечёт" ? "Физика" : "Англ")")
                        
                        Text("- пр")
                        
                        Text("- \(checkWeekPage == "Нечёт" ? "Д110" : "Г507")")
                    }
                    
                    HStack {
                        Text("5.").fontWeight(.bold)
                        
                        Text("14:40 - 16:10")
                        
                        Text("- МВ")
                        
                        Text("- лаб")
                    }
                    
                    HStack {
                        Text("6.").fontWeight(.bold)
                        
                        Text("16:20 - 17:50")
                        
                        Text("- МВ")
                        
                        Text("- лаб")
                    }
                    
                    HStack {
                        Text("7.").fontWeight(.bold)
                        
                        Text("18:00 - 19:30")
                        
                        Text("- МВ")
                        
                        Text("- лаб")
                    }
                }
                .frame(width: 340, height: 130)
                .fontWeight(.light)
                .padding(.bottom, 15)
            }
            
        }.listRowBackground(Color.red.opacity(0))
    }
}

struct Thursday : View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.white)
                .frame(width: 340, height: 210)
                .aspectRatio(1.0, contentMode: .fit)
            
            VStack {
                
                VStack(alignment: .center) {

                    Text("Четверг")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    
                    Text("")
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("1.").fontWeight(.bold)
                        
                        Text("8:00 - 9:30")
                        
                        Text("- Черчение")
                        
                        Text("- пр")
                    }
                    
                    HStack {
                        Text("2.").fontWeight(.bold)
                        
                        Text("9:40 - 11:10")
                        
                        Text("- Физика")
                        
                        Text("- лаб")
                    }
                    
                    HStack {
                        Text("3.").fontWeight(.bold)
                        
                        Text("11:20 - 12:50")
                        
                        Text("- бебрабебра")
                        
                        Text("- лаб")
                    }
                    
                    HStack {
                        Text("4.").fontWeight(.bold)
                        
                        Text("13:00 - 14:30")
                        
                        Text("- МВ")
                        
                        Text("- лаб")
                    }
                    
                    HStack {
                        Text("5.").fontWeight(.bold)
                        
                        Text("14:40 - 16:10")
                        
                        Text("- МВ")
                        
                        Text("- лаб")
                    }
                    
                    HStack {
                        Text("6.").fontWeight(.bold)
                        
                        Text("16:20 - 17:50")
                        
                        Text("- МВ")
                        
                        Text("- лаб")
                    }
                    
                    HStack {
                        Text("7.").fontWeight(.bold)
                        
                        Text("18:00 - 19:30")
                        
                        Text("- МВ")
                        
                        Text("- лаб")
                    }
                }
                .frame(width: 340, height: 130)
                .fontWeight(.light)
                .padding(.bottom, 15)
            }
            
        }.listRowBackground(Color.red.opacity(0))
    }
}

struct Friday : View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.white)
                .frame(width: 340, height: 210)
                .aspectRatio(1.0, contentMode: .fit)
            
            VStack {
                
                VStack(alignment: .center) {

                    Text("Пятница")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    
                    Text("")
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("1.").fontWeight(.bold)
                        
                        Text("8:00 - 9:30")
                        
                        Text("- Черчение")
                        
                        Text("- пр")
                    }
                    
                    HStack {
                        Text("2.").fontWeight(.bold)
                        
                        Text("9:40 - 11:10")
                        
                        Text("- Физика")
                        
                        Text("- лаб")
                    }
                    
                    HStack {
                        Text("3.").fontWeight(.bold)
                        
                        Text("11:20 - 12:50")
                        
                        Text("- бебрабебра")
                        
                        Text("- лаб")
                    }
                    
                    HStack {
                        Text("4.").fontWeight(.bold)
                        
                        Text("13:00 - 14:30")
                        
                        Text("- МВ")
                        
                        Text("- лаб")
                    }
                    
                    HStack {
                        Text("5.").fontWeight(.bold)
                        
                        Text("14:40 - 16:10")
                        
                        Text("- МВ")
                        
                        Text("- лаб")
                    }
                    
                    HStack {
                        Text("6.").fontWeight(.bold)
                        
                        Text("16:20 - 17:50")
                        
                        Text("- МВ")
                        
                        Text("- лаб")
                    }
                    
                    HStack {
                        Text("7.").fontWeight(.bold)
                        
                        Text("18:00 - 19:30")
                        
                        Text("- МВ")
                        
                        Text("- лаб")
                    }
                }
                .frame(width: 340, height: 130)
                .fontWeight(.light)
                .padding(.bottom, 15)
            }
            
        }.listRowBackground(Color.red.opacity(0))
    }
}

struct Saturday : View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.white)
                .frame(width: 340, height: 210)
                .aspectRatio(1.0, contentMode: .fit)
            
            VStack {
                
                VStack(alignment: .center) {

                    Text("Суббота")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    
                    Text("")
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("1.").fontWeight(.bold)
                        
                        Text("8:00 - 9:30")
                        
                        Text("- Черчение")
                        
                        Text("- пр")
                    }
                    
                    HStack {
                        Text("2.").fontWeight(.bold)
                        
                        Text("9:40 - 11:10")
                        
                        Text("- Физика")
                        
                        Text("- лаб")
                    }
                    
                    HStack {
                        Text("3.").fontWeight(.bold)
                        
                        Text("11:20 - 12:50")
                        
                        Text("- бебрабебра")
                        
                        Text("- лаб")
                    }
                    
                    HStack {
                        Text("4.").fontWeight(.bold)
                        
                        Text("13:00 - 14:30")
                        
                        Text("- МВ")
                        
                        Text("- лаб")
                    }
                    
                    HStack {
                        Text("5.").fontWeight(.bold)
                        
                        Text("14:40 - 16:10")
                        
                        Text("- МВ")
                        
                        Text("- лаб")
                    }
                    
                    HStack {
                        Text("6.").fontWeight(.bold)
                        
                        Text("16:20 - 17:50")
                        
                        Text("- МВ")
                        
                        Text("- лаб")
                    }
                    
                    HStack {
                        Text("7.").fontWeight(.bold)
                        
                        Text("18:00 - 19:30")
                        
                        Text("- МВ")
                        
                        Text("- лаб")
                    }
                }
                .frame(width: 340, height: 130)
                .fontWeight(.light)
                .padding(.bottom, 15)
            }
            
        }.listRowBackground(Color.red.opacity(0))
    }
}

struct Sunday : View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.white)
                .frame(width: 340, height: 210)
                .aspectRatio(1.0, contentMode: .fit)
            
            VStack {
                
                VStack(alignment: .center) {

                    Text("Воскресенье")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    
                    Text("")
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("1.").fontWeight(.bold)
                        
                        Text("8:00 - 9:30")
                        
                        Text("- Черчение")
                        
                        Text("- пр")
                    }
                    
                    HStack {
                        Text("2.").fontWeight(.bold)
                        
                        Text("9:40 - 11:10")
                        
                        Text("- Физика")
                        
                        Text("- лаб")
                    }
                    
                    HStack {
                        Text("3.").fontWeight(.bold)
                        
                        Text("11:20 - 12:50")
                        
                        Text("- бебрабебра")
                        
                        Text("- лаб")
                    }
                    
                    HStack {
                        Text("4.").fontWeight(.bold)
                        
                        Text("13:00 - 14:30")
                        
                        Text("- МВ")
                        
                        Text("- лаб")
                    }
                    
                    HStack {
                        Text("5.").fontWeight(.bold)
                        
                        Text("14:40 - 16:10")
                        
                        Text("- МВ")
                        
                        Text("- лаб")
                    }
                    
                    HStack {
                        Text("6.").fontWeight(.bold)
                        
                        Text("16:20 - 17:50")
                        
                        Text("- МВ")
                        
                        Text("- лаб")
                    }
                    
                    HStack {
                        Text("7.").fontWeight(.bold)
                        
                        Text("18:00 - 19:30")
                        
                        Text("- МВ")
                        
                        Text("- лаб")
                    }
                }
                .frame(width: 340, height: 130)
                .fontWeight(.light)
                .padding(.bottom, 15)
            }
            
        }.listRowBackground(Color.red.opacity(0))
    }
}




