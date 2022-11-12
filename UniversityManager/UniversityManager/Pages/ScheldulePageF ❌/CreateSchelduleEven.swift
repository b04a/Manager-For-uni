//
//  CreateSchelduleEven.swift
//  UniversityManager
//
//  Created by Danil Bochkarev on 01.11.2022.
//

import SwiftUI

struct CreateSchelduleEven: View {
    var body: some View {
        NavigationView {
            ZStack {
                backgroundScreen()
                
                List() {
                    // MARK: -  Надо сделать проверку + ограничения на ввод данных при заполнении данных в расписании
                    MondayAndThursdayEven() //c понедельника по четверг
                    FridayAndSundayEven() //с пятницы по субботу
                    SaveDataSchEven() //кнопка сохранить
                }
            
            }.scrollContentBackground(.hidden)
        }
    }
}

// MARK: -  С понедельника по четверг
struct MondayAndThursdayEven : View {
    var body: some View {
        MondayEven()
            .listRowBackground(Color.red.opacity(0))
        
        Text("").listRowBackground(Color.red.opacity(0))
        
        TuesdayEven()
            .listRowBackground(Color.red.opacity(0))
        
        Text("").listRowBackground(Color.red.opacity(0))
        
        WednesdayEven()
            .listRowBackground(Color.red.opacity(0))
        
        Text("").listRowBackground(Color.red.opacity(0))
        
        ThursdayEven()
            .listRowBackground(Color.red.opacity(0))
        
        Text("").listRowBackground(Color.red.opacity(0))
    }
}

// MARK: -  С пятницы по субботу
struct FridayAndSundayEven : View {
    var body: some View {
        FridayEven()
            .listRowBackground(Color.red.opacity(0))

        Text("").listRowBackground(Color.red.opacity(0))

        SaturdayEven()
            .listRowBackground(Color.red.opacity(0))

        Text("").listRowBackground(Color.red.opacity(0))

        SundayEven()
            .listRowBackground(Color.red.opacity(0))

    }
}

// MARK: -  Кнопка сохранить 
struct SaveDataSchEven : View {
    
    @State var checkButton = false
    @State var timeRemaining = 3
    
    var body: some View {
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        
        if checkButton {
            Text("Данные сохранены ⏱ \(timeRemaining)")
                .font(.system(size: 20))
                .foregroundColor(.white)
                .frame(width: 280, height: 30)
                .background(.green)
                .cornerRadius(20)
                .fontWeight(.bold)
                .shadow(color: .green, radius: 8)
                .listRowBackground(Color.red.opacity(0))
                .padding(.leading, 10)
                .onReceive(timer) { _ in
                    if timeRemaining > 0 {
                        timeRemaining -= 1
                    } else {
                        checkButton = false
                        timeRemaining = 0
                    }
                }
        } else {
            Text("").listRowBackground(Color.red.opacity(0))
        }
        
        Button {
            
            checkButton.toggle()
        } label: {
            Text("Сохранить")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 200, height: 45)
                .background(.green)
                .cornerRadius(20)
                .fontWeight(.bold)

        }
        .shadow(color: .green, radius: 8)
        .listRowBackground(Color.red.opacity(0))
        .padding(.leading, 50)

    }
}

// MARK: -  Все готовые заполнения для понедельника - ✅
struct MondayEven : View {
    @State var Mpair1Name = ""
    @State var Mpair1Type = ""
    @State var Mpair1Cabinet = ""
    
    @State private var Mpair2Name = ""
    @State private var Mpair2Type = ""
    @State private var Mpair2Cabinet = ""
    
    @State private var Mpair3Name = ""
    @State private var Mpair3Type = ""
    @State private var Mpair3Cabinet = ""
    
    @State private var Mpair4Name = ""
    @State private var Mpair4Type = ""
    @State private var Mpair4Cabinet = ""
    
    @State private var Mpair5Name = ""
    @State private var Mpair5Type = ""
    @State private var Mpair5Cabinet = ""
    
    @State private var Mpair6Name = ""
    @State private var Mpair6Type = ""
    @State private var Mpair6Cabinet = ""
    
    @State private var Mpair7Name = ""
    @State private var Mpair7Type = ""
    @State private var Mpair7Cabinet = ""

    
    var body: some View {
        Text("Чётная неделя")
            .foregroundColor(.white)
            .frame(width: 320, height: 20)
            .font(.system(size: 25))
            .fontWeight(.medium)
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
        
        Text("")
        
        Text("Понедельник")

            .foregroundColor(.white)
            .frame(width: 320, height: 20)
            .font(.system(size: 25))
            .fontWeight(.medium)
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
        
        HStack(spacing: 3) {
            Text("1")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $Mpair1Name)
                .foregroundColor(Mpair1Name.count > 1 && Mpair1Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $Mpair1Type)
                .foregroundColor(Mpair1Type.count > 1 && Mpair1Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $Mpair1Cabinet)
                .foregroundColor(Mpair1Cabinet.count > 1 && Mpair1Cabinet.count < 5 ? .black : .red)
                .frame(width: 70)
                .fontWeight(.medium)
                .padding(10)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
        }
        
        HStack(spacing: 3) {
            Text("2")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $Mpair2Name)
                .foregroundColor(Mpair2Name.count > 1 && Mpair2Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
                
            
            TextField("Вид", text: $Mpair2Type)
                .foregroundColor(Mpair2Type.count > 1 && Mpair2Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $Mpair2Cabinet)
                .foregroundColor(Mpair2Cabinet.count > 1 && Mpair2Cabinet.count < 5 ? .black : .red)
                .frame(width: 70)
                .fontWeight(.medium)
                .padding(10)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
        }
        
        HStack(spacing: 3) {
            Text("3")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $Mpair3Name)
                .foregroundColor(Mpair3Name.count > 1 && Mpair3Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $Mpair3Type)
                .foregroundColor(Mpair3Type.count > 1 && Mpair3Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $Mpair3Cabinet)
                .foregroundColor(Mpair3Cabinet.count > 1 && Mpair3Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
        
        HStack(spacing: 3) {
            Text("4")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $Mpair4Name)
                .foregroundColor(Mpair4Name.count > 1 && Mpair4Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $Mpair4Type)
                .foregroundColor(Mpair4Type.count > 1 && Mpair4Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $Mpair4Cabinet)
                .foregroundColor(Mpair4Cabinet.count > 1 && Mpair4Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
        
        HStack(spacing: 3) {
            Text("5")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $Mpair5Name)
                .foregroundColor(Mpair5Name.count > 1 && Mpair5Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $Mpair5Type)
                .foregroundColor(Mpair5Type.count > 1 && Mpair5Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $Mpair5Cabinet)
                .foregroundColor(Mpair5Cabinet.count > 1 && Mpair5Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
        
        HStack(spacing: 3) {
            Text("6")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $Mpair6Name)
                .foregroundColor(Mpair6Name.count > 1 && Mpair6Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $Mpair6Type)
                .foregroundColor(Mpair6Type.count > 1 && Mpair6Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $Mpair6Cabinet)
                .foregroundColor(Mpair6Cabinet.count > 1 && Mpair6Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
        
        HStack(spacing: 3) {
            Text("7")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $Mpair7Name)
                .foregroundColor(Mpair7Name.count > 1 && Mpair7Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $Mpair7Type)
                .foregroundColor(Mpair7Type.count > 1 && Mpair7Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $Mpair7Cabinet)
                .foregroundColor(Mpair7Cabinet.count > 1 && Mpair7Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
    }
}

// MARK: -  Все готовые заполнения для вторника - ✅
struct TuesdayEven : View {
    @State private var Tpair1Name = ""
    @State private var Tpair1Type = ""
    @State private var Tpair1Cabinet = ""
    
    @State private var Tpair2Name = ""
    @State private var Tpair2Type = ""
    @State private var Tpair2Cabinet = ""
    
    @State private var Tpair3Name = ""
    @State private var Tpair3Type = ""
    @State private var Tpair3Cabinet = ""
    
    @State private var Tpair4Name = ""
    @State private var Tpair4Type = ""
    @State private var Tpair4Cabinet = ""
    
    @State private var Tpair5Name = ""
    @State private var Tpair5Type = ""
    @State private var Tpair5Cabinet = ""
    
    @State private var Tpair6Name = ""
    @State private var Tpair6Type = ""
    @State private var Tpair6Cabinet = ""
    
    @State private var Tpair7Name = ""
    @State private var Tpair7Type = ""
    @State private var Tpair7Cabinet = ""
    
    var body: some View {
        Text("Вторник")

            .foregroundColor(.white)
            .frame(width: 320, height: 20)
            .font(.system(size: 25))
            .fontWeight(.medium)
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
        
        HStack(spacing: 3) {
            Text("1")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $Tpair1Name)
                .foregroundColor(Tpair1Name.count > 1 && Tpair1Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $Tpair1Type)
                .foregroundColor(Tpair1Type.count > 1 && Tpair1Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $Tpair1Cabinet)
                .foregroundColor(Tpair1Cabinet.count > 1 && Tpair1Cabinet.count < 5 ? .black : .red)
                .frame(width: 70)
                .fontWeight(.medium)
                .padding(10)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
        }
        
        HStack(spacing: 3) {
            Text("2")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $Tpair2Name)
                .foregroundColor(Tpair2Name.count > 1 && Tpair2Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
                
            
            TextField("Вид", text: $Tpair2Type)
                .foregroundColor(Tpair2Type.count > 1 && Tpair2Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $Tpair2Cabinet)
                .foregroundColor(Tpair2Cabinet.count > 1 && Tpair2Cabinet.count < 5 ? .black : .red)
                .frame(width: 70)
                .fontWeight(.medium)
                .padding(10)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
        }
        
        HStack(spacing: 3) {
            Text("3")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $Tpair3Name)
                .foregroundColor(Tpair3Name.count > 1 && Tpair3Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $Tpair3Type)
                .foregroundColor(Tpair3Type.count > 1 && Tpair3Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $Tpair3Cabinet)
                .foregroundColor(Tpair3Cabinet.count > 1 && Tpair3Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
        
        HStack(spacing: 3) {
            Text("4")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $Tpair4Name)
                .foregroundColor(Tpair4Name.count > 1 && Tpair4Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $Tpair4Type)
                .foregroundColor(Tpair4Type.count > 1 && Tpair4Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $Tpair4Cabinet)
                .foregroundColor(Tpair4Cabinet.count > 1 && Tpair4Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
        
        HStack(spacing: 3) {
            Text("5")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $Tpair5Name)
                .foregroundColor(Tpair5Name.count > 1 && Tpair5Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $Tpair5Type)
                .foregroundColor(Tpair5Type.count > 1 && Tpair5Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $Tpair5Cabinet)
                .foregroundColor(Tpair5Cabinet.count > 1 && Tpair5Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
        
        HStack(spacing: 3) {
            Text("6")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $Tpair6Name)
                .foregroundColor(Tpair6Name.count > 1 && Tpair6Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $Tpair6Type)
                .foregroundColor(Tpair6Type.count > 1 && Tpair6Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $Tpair6Cabinet)
                .foregroundColor(Tpair6Cabinet.count > 1 && Tpair6Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
        
        HStack(spacing: 3) {
            Text("7")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $Tpair7Name)
                .foregroundColor(Tpair7Name.count > 1 && Tpair7Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $Tpair7Type)
                .foregroundColor(Tpair7Type.count > 1 && Tpair7Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $Tpair7Cabinet)
                .foregroundColor(Tpair7Cabinet.count > 1 && Tpair7Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
    }
}

// MARK: -  Все готовые заполнения для среды - ✅
struct WednesdayEven : View {
    @State private var Wpair1Name = ""
    @State private var Wpair1Type = ""
    @State private var Wpair1Cabinet = ""
    
    @State private var Wpair2Name = ""
    @State private var Wpair2Type = ""
    @State private var Wpair2Cabinet = ""
    
    @State private var Wpair3Name = ""
    @State private var Wpair3Type = ""
    @State private var Wpair3Cabinet = ""
    
    @State private var Wpair4Name = ""
    @State private var Wpair4Type = ""
    @State private var Wpair4Cabinet = ""
    
    @State private var Wpair5Name = ""
    @State private var Wpair5Type = ""
    @State private var Wpair5Cabinet = ""
    
    @State private var Wpair6Name = ""
    @State private var Wpair6Type = ""
    @State private var Wpair6Cabinet = ""
    
    @State private var Wpair7Name = ""
    @State private var Wpair7Type = ""
    @State private var Wpair7Cabinet = ""
    
    var body: some View {
        Text("Среда")

            .foregroundColor(.white)
            .frame(width: 320, height: 20)
            .font(.system(size: 25))
            .fontWeight(.medium)
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
        
        HStack(spacing: 3) {
            Text("1")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $Wpair1Name)
                .foregroundColor(Wpair1Name.count > 1 && Wpair1Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $Wpair1Type)
                .foregroundColor(Wpair1Type.count > 1 && Wpair1Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $Wpair1Cabinet)
                .foregroundColor(Wpair1Cabinet.count > 1 && Wpair1Cabinet.count < 5 ? .black : .red)
                .frame(width: 70)
                .fontWeight(.medium)
                .padding(10)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
        }
        
        HStack(spacing: 3) {
            Text("2")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $Wpair2Name)
                .foregroundColor(Wpair2Name.count > 1 && Wpair2Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
                
            
            TextField("Вид", text: $Wpair2Type)
                .foregroundColor(Wpair2Type.count > 1 && Wpair2Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $Wpair2Cabinet)
                .foregroundColor(Wpair2Cabinet.count > 1 && Wpair2Cabinet.count < 5 ? .black : .red)
                .frame(width: 70)
                .fontWeight(.medium)
                .padding(10)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
        }
        
        HStack(spacing: 3) {
            Text("3")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $Wpair3Name)
                .foregroundColor(Wpair3Name.count > 1 && Wpair3Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $Wpair3Type)
                .foregroundColor(Wpair3Type.count > 1 && Wpair3Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $Wpair3Cabinet)
                .foregroundColor(Wpair3Cabinet.count > 1 && Wpair3Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
        
        HStack(spacing: 3) {
            Text("4")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $Wpair4Name)
                .foregroundColor(Wpair4Name.count > 1 && Wpair4Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $Wpair4Type)
                .foregroundColor(Wpair4Type.count > 1 && Wpair4Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $Wpair4Cabinet)
                .foregroundColor(Wpair4Cabinet.count > 1 && Wpair4Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
        
        HStack(spacing: 3) {
            Text("5")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $Wpair5Name)
                .foregroundColor(Wpair5Name.count > 1 && Wpair5Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $Wpair5Type)
                .foregroundColor(Wpair5Type.count > 1 && Wpair5Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $Wpair5Cabinet)
                .foregroundColor(Wpair5Cabinet.count > 1 && Wpair5Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
        
        HStack(spacing: 3) {
            Text("6")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $Wpair6Name)
                .foregroundColor(Wpair6Name.count > 1 && Wpair6Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $Wpair6Type)
                .foregroundColor(Wpair6Type.count > 1 && Wpair6Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $Wpair6Cabinet)
                .foregroundColor(Wpair6Cabinet.count > 1 && Wpair6Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
        
        HStack(spacing: 3) {
            Text("7")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $Wpair7Name)
                .foregroundColor(Wpair7Name.count > 1 && Wpair7Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $Wpair7Type)
                .foregroundColor(Wpair7Type.count > 1 && Wpair7Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $Wpair7Cabinet)
                .foregroundColor(Wpair7Cabinet.count > 1 && Wpair7Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
    }
}

// MARK: -  Все готовые заполнения для четверга - ✅
struct ThursdayEven : View {
    @State private var THpair1Name = ""
    @State private var THpair1Type = ""
    @State private var THpair1Cabinet = ""
    
    @State private var THpair2Name = ""
    @State private var THpair2Type = ""
    @State private var THpair2Cabinet = ""
    
    @State private var THpair3Name = ""
    @State private var THpair3Type = ""
    @State private var THpair3Cabinet = ""
    
    @State private var THpair4Name = ""
    @State private var THpair4Type = ""
    @State private var THpair4Cabinet = ""
    
    @State private var THpair5Name = ""
    @State private var THpair5Type = ""
    @State private var THpair5Cabinet = ""
    
    @State private var THpair6Name = ""
    @State private var THpair6Type = ""
    @State private var THpair6Cabinet = ""
    
    @State private var THpair7Name = ""
    @State private var THpair7Type = ""
    @State private var THpair7Cabinet = ""
    
    var body: some View {
        Text("Четверг")

            .foregroundColor(.white)
            .frame(width: 320, height: 20)
            .font(.system(size: 25))
            .fontWeight(.medium)
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
        
        HStack(spacing: 3) {
            Text("1")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $THpair1Name)
                .foregroundColor(THpair1Name.count > 1 && THpair1Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $THpair1Type)
                .foregroundColor(THpair1Type.count > 1 && THpair1Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $THpair1Cabinet)
                .foregroundColor(THpair1Cabinet.count > 1 && THpair1Cabinet.count < 5 ? .black : .red)
                .frame(width: 70)
                .fontWeight(.medium)
                .padding(10)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
        }
        
        HStack(spacing: 3) {
            Text("2")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $THpair2Name)
                .foregroundColor(THpair2Name.count > 1 && THpair2Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
                
            
            TextField("Вид", text: $THpair2Type)
                .foregroundColor(THpair2Type.count > 1 && THpair2Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $THpair2Cabinet)
                .foregroundColor(THpair2Cabinet.count > 1 && THpair2Cabinet.count < 5 ? .black : .red)
                .frame(width: 70)
                .fontWeight(.medium)
                .padding(10)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
        }
        
        HStack(spacing: 3) {
            Text("3")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $THpair3Name)
                .foregroundColor(THpair3Name.count > 1 && THpair3Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $THpair3Type)
                .foregroundColor(THpair3Type.count > 1 && THpair3Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $THpair3Cabinet)
                .foregroundColor(THpair3Cabinet.count > 1 && THpair3Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
        
        HStack(spacing: 3) {
            Text("4")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $THpair4Name)
                .foregroundColor(THpair4Name.count > 1 && THpair4Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $THpair4Type)
                .foregroundColor(THpair4Type.count > 1 && THpair4Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $THpair4Cabinet)
                .foregroundColor(THpair4Cabinet.count > 1 && THpair4Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
        
        HStack(spacing: 3) {
            Text("5")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $THpair5Name)
                .foregroundColor(THpair5Name.count > 1 && THpair5Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $THpair5Type)
                .foregroundColor(THpair5Type.count > 1 && THpair5Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $THpair5Cabinet)
                .foregroundColor(THpair5Cabinet.count > 1 && THpair5Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
        
        HStack(spacing: 3) {
            Text("6")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $THpair6Name)
                .foregroundColor(THpair6Name.count > 1 && THpair6Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $THpair6Type)
                .foregroundColor(THpair6Type.count > 1 && THpair6Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $THpair6Cabinet)
                .foregroundColor(THpair6Cabinet.count > 1 && THpair6Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
        
        HStack(spacing: 3) {
            Text("7")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $THpair7Name)
                .foregroundColor(THpair7Name.count > 1 && THpair7Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $THpair7Type)
                .foregroundColor(THpair7Type.count > 1 && THpair7Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $THpair7Cabinet)
                .foregroundColor(THpair7Cabinet.count > 1 && THpair7Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
    }
}

// MARK: -  Все готовые заполнения для пятницы - ✅
struct FridayEven : View {
    @State private var Fpair1Name = ""
    @State private var Fpair1Type = ""
    @State private var Fpair1Cabinet = ""
    
    @State private var Fpair2Name = ""
    @State private var Fpair2Type = ""
    @State private var Fpair2Cabinet = ""
    
    @State private var Fpair3Name = ""
    @State private var Fpair3Type = ""
    @State private var Fpair3Cabinet = ""
    
    @State private var Fpair4Name = ""
    @State private var Fpair4Type = ""
    @State private var Fpair4Cabinet = ""
    
    @State private var Fpair5Name = ""
    @State private var Fpair5Type = ""
    @State private var Fpair5Cabinet = ""
    
    @State private var Fpair6Name = ""
    @State private var Fpair6Type = ""
    @State private var Fpair6Cabinet = ""
    
    @State private var Fpair7Name = ""
    @State private var Fpair7Type = ""
    @State private var Fpair7Cabinet = ""
    
    var body: some View {
        Text("Пятница")

            .foregroundColor(.white)
            .frame(width: 320, height: 20)
            .font(.system(size: 25))
            .fontWeight(.medium)
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
        
        HStack(spacing: 3) {
            Text("1")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $Fpair1Name)
                .foregroundColor(Fpair1Name.count > 1 && Fpair1Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $Fpair1Type)
                .foregroundColor(Fpair1Type.count > 1 && Fpair1Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $Fpair1Cabinet)
                .foregroundColor(Fpair1Cabinet.count > 1 && Fpair1Cabinet.count < 5 ? .black : .red)
                .frame(width: 70)
                .fontWeight(.medium)
                .padding(10)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
        }
        
        HStack(spacing: 3) {
            Text("2")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $Fpair2Name)
                .foregroundColor(Fpair2Name.count > 1 && Fpair2Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
                
            
            TextField("Вид", text: $Fpair2Type)
                .foregroundColor(Fpair2Type.count > 1 && Fpair2Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $Fpair2Cabinet)
                .foregroundColor(Fpair2Cabinet.count > 1 && Fpair2Cabinet.count < 5 ? .black : .red)
                .frame(width: 70)
                .fontWeight(.medium)
                .padding(10)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
        }
        
        HStack(spacing: 3) {
            Text("3")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $Fpair3Name)
                .foregroundColor(Fpair3Name.count > 1 && Fpair3Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $Fpair3Type)
                .foregroundColor(Fpair3Type.count > 1 && Fpair3Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $Fpair3Cabinet)
                .foregroundColor(Fpair3Cabinet.count > 1 && Fpair3Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
        
        HStack(spacing: 3) {
            Text("4")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $Fpair4Name)
                .foregroundColor(Fpair4Name.count > 1 && Fpair4Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $Fpair4Type)
                .foregroundColor(Fpair4Type.count > 1 && Fpair4Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $Fpair4Cabinet)
                .foregroundColor(Fpair4Cabinet.count > 1 && Fpair4Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
        
        HStack(spacing: 3) {
            Text("5")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $Fpair5Name)
                .foregroundColor(Fpair5Name.count > 1 && Fpair5Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $Fpair5Type)
                .foregroundColor(Fpair5Type.count > 1 && Fpair5Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $Fpair5Cabinet)
                .foregroundColor(Fpair5Cabinet.count > 1 && Fpair5Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
        
        HStack(spacing: 3) {
            Text("6")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $Fpair6Name)
                .foregroundColor(Fpair6Name.count > 1 && Fpair6Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $Fpair6Type)
                .foregroundColor(Fpair6Type.count > 1 && Fpair6Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $Fpair6Cabinet)
                .foregroundColor(Fpair6Cabinet.count > 1 && Fpair6Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
        
        HStack(spacing: 3) {
            Text("7")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $Fpair7Name)
                .foregroundColor(Fpair7Name.count > 1 && Fpair7Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $Fpair7Type)
                .foregroundColor(Fpair7Type.count > 1 && Fpair7Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $Fpair7Cabinet)
                .foregroundColor(Fpair7Cabinet.count > 1 && Fpair7Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
    }
}

// MARK: -  Все готовые заполнения для субботы - ✅
struct SaturdayEven : View {
    @State private var SApair1Name = ""
    @State private var SApair1Type = ""
    @State private var SApair1Cabinet = ""
    
    @State private var SApair2Name = ""
    @State private var SApair2Type = ""
    @State private var SApair2Cabinet = ""
    
    @State private var SApair3Name = ""
    @State private var SApair3Type = ""
    @State private var SApair3Cabinet = ""
    
    @State private var SApair4Name = ""
    @State private var SApair4Type = ""
    @State private var SApair4Cabinet = ""
    
    @State private var SApair5Name = ""
    @State private var SApair5Type = ""
    @State private var SApair5Cabinet = ""
    
    @State private var SApair6Name = ""
    @State private var SApair6Type = ""
    @State private var SApair6Cabinet = ""
    
    @State private var SApair7Name = ""
    @State private var SApair7Type = ""
    @State private var SApair7Cabinet = ""
    
    var body: some View {
        Text("Суббота")

            .foregroundColor(.white)
            .frame(width: 320, height: 20)
            .font(.system(size: 25))
            .fontWeight(.medium)
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
        
        HStack(spacing: 3) {
            Text("1")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $SApair1Name)
                .foregroundColor(SApair1Name.count > 1 && SApair1Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $SApair1Type)
                .foregroundColor(SApair1Type.count > 1 && SApair1Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $SApair1Cabinet)
                .foregroundColor(SApair1Cabinet.count > 1 && SApair1Cabinet.count < 5 ? .black : .red)
                .frame(width: 70)
                .fontWeight(.medium)
                .padding(10)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
        }
        
        HStack(spacing: 3) {
            Text("2")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $SApair2Name)
                .foregroundColor(SApair2Name.count > 1 && SApair2Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
                
            
            TextField("Вид", text: $SApair2Type)
                .foregroundColor(SApair2Type.count > 1 && SApair2Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $SApair2Cabinet)
                .foregroundColor(SApair2Cabinet.count > 1 && SApair2Cabinet.count < 5 ? .black : .red)
                .frame(width: 70)
                .fontWeight(.medium)
                .padding(10)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
        }
        
        HStack(spacing: 3) {
            Text("3")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $SApair3Name)
                .foregroundColor(SApair3Name.count > 1 && SApair3Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $SApair3Type)
                .foregroundColor(SApair3Type.count > 1 && SApair3Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $SApair3Cabinet)
                .foregroundColor(SApair3Cabinet.count > 1 && SApair3Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
        
        HStack(spacing: 3) {
            Text("4")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $SApair4Name)
                .foregroundColor(SApair4Name.count > 1 && SApair4Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $SApair4Type)
                .foregroundColor(SApair4Type.count > 1 && SApair4Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $SApair4Cabinet)
                .foregroundColor(SApair4Cabinet.count > 1 && SApair4Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
        
        HStack(spacing: 3) {
            Text("5")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $SApair5Name)
                .foregroundColor(SApair5Name.count > 1 && SApair5Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $SApair5Type)
                .foregroundColor(SApair5Type.count > 1 && SApair5Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $SApair5Cabinet)
                .foregroundColor(SApair5Cabinet.count > 1 && SApair5Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
        
        HStack(spacing: 3) {
            Text("6")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $SApair6Name)
                .foregroundColor(SApair6Name.count > 1 && SApair6Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $SApair6Type)
                .foregroundColor(SApair6Type.count > 1 && SApair6Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $SApair6Cabinet)
                .foregroundColor(SApair6Cabinet.count > 1 && SApair6Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
        
        HStack(spacing: 3) {
            Text("7")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $SApair7Name)
                .foregroundColor(SApair7Name.count > 1 && SApair7Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $SApair7Type)
                .foregroundColor(SApair7Type.count > 1 && SApair7Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $SApair7Cabinet)
                .foregroundColor(SApair7Cabinet.count > 1 && SApair7Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
    }
}

// MARK: -  Все готовые заполнения для воскресенья - ✅
struct SundayEven : View {
    @State private var SUpair1Name = ""
    @State private var SUpair1Type = ""
    @State private var SUpair1Cabinet = ""
    
    @State private var SUpair2Name = ""
    @State private var SUpair2Type = ""
    @State private var SUpair2Cabinet = ""
    
    @State private var SUpair3Name = ""
    @State private var SUpair3Type = ""
    @State private var SUpair3Cabinet = ""
    
    @State private var SUpair4Name = ""
    @State private var SUpair4Type = ""
    @State private var SUpair4Cabinet = ""
    
    @State private var SUpair5Name = ""
    @State private var SUpair5Type = ""
    @State private var SUpair5Cabinet = ""
    
    @State private var SUpair6Name = ""
    @State private var SUpair6Type = ""
    @State private var SUpair6Cabinet = ""
    
    @State private var SUpair7Name = ""
    @State private var SUpair7Type = ""
    @State private var SUpair7Cabinet = ""
    
    var body: some View {
        Text("Воскресенье")

            .foregroundColor(.white)
            .frame(width: 320, height: 20)
            .font(.system(size: 25))
            .fontWeight(.medium)
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
        
        HStack(spacing: 3) {
            Text("1")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $SUpair1Name)
                .foregroundColor(SUpair1Name.count > 1 && SUpair1Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $SUpair1Type)
                .foregroundColor(SUpair1Type.count > 1 && SUpair1Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $SUpair1Cabinet)
                .foregroundColor(SUpair1Cabinet.count > 1 && SUpair1Cabinet.count < 5 ? .black : .red)
                .frame(width: 70)
                .fontWeight(.medium)
                .padding(10)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
        }
        
        HStack(spacing: 3) {
            Text("2")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $SUpair2Name)
                .foregroundColor(SUpair2Name.count > 1 && SUpair2Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
                
            
            TextField("Вид", text: $SUpair2Type)
                .foregroundColor(SUpair2Type.count > 1 && SUpair2Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $SUpair2Cabinet)
                .foregroundColor(SUpair2Cabinet.count > 1 && SUpair2Cabinet.count < 5 ? .black : .red)
                .frame(width: 70)
                .fontWeight(.medium)
                .padding(10)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
        }
        
        HStack(spacing: 3) {
            Text("3")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $SUpair3Name)
                .foregroundColor(SUpair3Name.count > 1 && SUpair3Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $SUpair3Type)
                .foregroundColor(SUpair3Type.count > 1 && SUpair3Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $SUpair3Cabinet)
                .foregroundColor(SUpair3Cabinet.count > 1 && SUpair3Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
        
        HStack(spacing: 3) {
            Text("4")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $SUpair4Name)
                .foregroundColor(SUpair4Name.count > 1 && SUpair4Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $SUpair4Type)
                .foregroundColor(SUpair4Type.count > 1 && SUpair4Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $SUpair4Cabinet)
                .foregroundColor(SUpair4Cabinet.count > 1 && SUpair4Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
        
        HStack(spacing: 3) {
            Text("5")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $SUpair5Name)
                .foregroundColor(SUpair5Name.count > 1 && SUpair5Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $SUpair5Type)
                .foregroundColor(SUpair5Type.count > 1 && SUpair5Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $SUpair5Cabinet)
                .foregroundColor(SUpair5Cabinet.count > 1 && SUpair5Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
        
        HStack(spacing: 3) {
            Text("6")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $SUpair6Name)
                .foregroundColor(SUpair6Name.count > 1 && SUpair6Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $SUpair6Type)
                .foregroundColor(SUpair6Type.count > 1 && SUpair6Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $SUpair6Cabinet)
                .foregroundColor(SUpair6Cabinet.count > 1 && SUpair6Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
        
        HStack(spacing: 3) {
            Text("7")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .fontWeight(.bold)
            
            TextField("Название пары", text: $SUpair7Name)
                .foregroundColor(SUpair7Name.count > 1 && SUpair7Name.count < 8 ? .black : .red)
                .textFieldStyle(NamePair())
            
            TextField("Вид", text: $SUpair7Type)
                .foregroundColor(SUpair7Type.count > 1 && SUpair7Type.count < 4 ? .black : .red)
                .textFieldStyle(TypePair())
            
            TextField("Кабинет", text: $SUpair7Cabinet)
                .foregroundColor(SUpair7Cabinet.count > 1 && SUpair7Cabinet.count < 5 ? .black : .red)
                .textFieldStyle(CabinetPair())
        }
    }
}


struct CreateSchelduleEven_Previews: PreviewProvider {
    static var previews: some View {
        CreateSchelduleEven()
    }
}
