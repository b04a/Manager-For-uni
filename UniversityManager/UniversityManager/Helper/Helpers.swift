//
//  Helpers.swift
//  UniversityManager
//
//  Created by Danil Bochkarev on 19.10.2022.
//

import SwiftUI
import CoreData


// MARK: -  Фон для всех TabView
struct backgroundScreen: View {
    var body : some View {
        
        imageWeather()
            .resizable()
            .edgesIgnoringSafeArea(.all)
        
    }
}

var numerNotie = 5 //сюда подкрепить общее колличество заметок

func colorTabBarAndIcon() -> Color {
    var color : Color = .blue
    let check = imageWeather()

    switch check {
    case Image("zima"):
        color = .blue
    case Image("osen"):
        color = .orange
    case Image("leto"):
        color = .green
    default:
        color = .brown
    }

    return color
}


func checMonth() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM"
            
    let month = dateFormatter.string(from: Date())
    let weather = month.uppercased()
    
    return weather
}

func imageWeather() -> Image {
    let check = Int(checMonth())
    var result = ""

    switch check {
    case 12, 1, 2:
        result = "zima"
    case 3, 4, 5:
        result = "vesna"
    case 6, 7, 8:
        result = "leto"
    default:
        result = "osen"
    }
    
    return Image(result)
}

func dateInMainPage() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd MMMM yyyy"
    dateFormatter.locale = Locale(identifier: "ru_RU")
            
    let month = String(dateFormatter.string(from: Date()))
    
    return month //21-октября-2022
}

func TimeOfYear() -> String {
    return oddEvenWeekCheck() + "," + " " + getDayOfWeek() + "," + " " + checMonth() + " " + "Месяц" // Осень
}


func getDayOfWeek() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE"
    dateFormatter.locale = Locale(identifier: "ru_RU")
            
    let dayWeek = String(dateFormatter.string(from: Date()))
    
    var result = ""
    
    switch dayWeek {
    case "воскресенье":
        result = "ВС"
    case "суббота":
        result = "СБ"
    case "пятница":
        result = "ПТ"
    case "четверг":
        result = "ЧТ"
    case "среда":
        result = "СР"
    case "вторник":
        result = "ВТ"
    default:
        result = "ПН"
    }
    
    return result
}

func checkNotie(numerNotie: Int) -> String {
    var result = ""
    var checker = true

    let work = String(numerNotie).compactMap{String(String($0))}
    var mass = [String]()
    
    for i in work {
        if i != "0" {
            mass.append(i)
        } else if i == "0" && numerNotie == 0 {
            result = "заметок"
            checker.toggle()
        }
    }

    if checker {
        switch Int(mass.last!)! {
        case 1:
            result = "заметка"
        case 2...4:
            result = "заметки"
        case 0:
            result = "заметок"
        default:
            result = "заметок"
        }
    }

    return result
}

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration

            .fontWeight(.medium)
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
            //.shadow(color: .gray, radius: 8)
    }
}

func OvalTextFieldStyleHelperColor1() -> Color {
    let check = Int(checMonth())
    var result : Color

    switch check {
    case 12, 1, 2:
        result = Color("zima1")//синий голубой
    case 6, 7, 8:
        result = Color("leto1") //светлый зеленый зеленый
    default:
        result = Color.yellow //желтый оранжевый
    }
    
    return result
}

func OvalTextFieldStyleHelperColor2() -> Color {
    let check = Int(checMonth())
    var result : Color

    switch check {
    case 12, 1, 2:
        result = Color("zima2") //синий голубой
    case 6, 7, 8:
        result = Color("leto2") //светлый зеленый зеленый
    default:
        result = Color.orange //желтый оранжевый
    }
    
    return result
}


func oddEvenWeekCheck() -> String {
    
    let date = Date()

    let amPickerMinutes = DateFormatter()
    amPickerMinutes.dateFormat = "w"
    
    var result = ""

    let minutes = amPickerMinutes.string(from: date)
    let amPickerMinutesInt = Int(minutes)! - 1

    if amPickerMinutesInt % 2 == 0 {
        result = "Чёт"
    } else {
        result = "Нечёт"
    }
    
    return result
}


struct NamePair : TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .frame(width: 126)
            .fontWeight(.medium)
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
    }
}

struct TypePair : TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .frame(width: 35)
            .fontWeight(.medium)
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
    }
}

struct CabinetPair : TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .frame(width: 70)
            .fontWeight(.medium)
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
    }
}

func ColorForImage() -> Color {
    let check = Int(checMonth())
    var result : Color

    switch check {
    case 12, 1, 2:
        result = Color("zima1")//синий голубой
    case 6, 7, 8:
        result = Color("leto1") //светлый зеленый зеленый
    default:
        result = Color.yellow //желтый оранжевый
    }
    
    return result
}

