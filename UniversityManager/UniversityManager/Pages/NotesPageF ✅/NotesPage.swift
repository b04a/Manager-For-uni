//
//  NotesPage.swift
//  UniversityManager
//
//  Created by Danil Bochkarev on 19.10.2022.
//

import SwiftUI
import CoreData

enum Priority : String, Identifiable, CaseIterable {
    
    var id: UUID {
        return UUID()
    }
    
    case low = "🟢"
    case medium = "🟡"
    case high = "🔴"
}

extension Priority {
    var title : String {
        switch self {
        case .low:
            return "Легкий 🟢"
        case .medium:
            return "Средний 🟡"
        case .high:
            return "Высокий 🔴"
        }
    }
}

struct NotesPage: View {
    
    @State private var title = ""
    @State private var opis = ""
    @State private var selectionPriority : Priority = .medium
    @State private var checkButton = false
    
    //123
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    
    @State var timeRemaining = 3
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundScreen()
                
                
                VStack(spacing: 30) {
                    VStack(spacing: 15) {
                        TextField("   Заголовок... (от 2 до 15 символов)", text: $title)
                            .textFieldStyle(OvalTextFieldStyle())
                        
                        
                            .shadow(color: title.count < 16 && title.count > 2 ? .green : .red, radius: title.count < 16 ? 10 : 10)
                        
                        
                        TextField("   Описание... (от 2 до 30 символов)", text: $opis)
                            .textFieldStyle(OvalTextFieldStyle())
                        
                            .shadow(color: opis.count < 31 && opis.count > 2 ? .green : .red, radius: opis.count < 31 ? 10 : 10)
                        
                    }.frame(width: 350)
                    
                    VStack {
                        Text(" ")
                            .frame(width: 250, height: 5)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.gray, Color.gray]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .cornerRadius(20)
                        
                    }
                    
                    VStack(spacing: 14) {
                        Text("Выберите важность заметки")
                            .font(.system(size: 20))
                        
                        
                            .foregroundColor(.black)
                            .frame(width: 350, height: 35)
                            .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .cornerRadius(20)
                            .fontWeight(.medium)
                            .shadow(color: .gray, radius: 8)
                        
                        Picker("Priority", selection: $selectionPriority) {
                            
                            ForEach(Priority.allCases) { priority in
                                Text(priority.title)
                                    .tag(priority)
                            }
                        }
                        
                        .pickerStyle(.segmented)
                        .padding(1)
                        
                        .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(idealHeight: 16)
                        .frame(width: 350)
                        .cornerRadius(20)
                    }
                    
                    
                    VStack {
                        Text(" ")
                            .frame(width: 250, height: 5)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.gray, Color.gray]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .cornerRadius(20)
                        
                        
                    }
                    
                    VStack {
                        
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
                    }
                    VStack {
                        
                        if checkButton == true && title.count > 2 && title.count < 16 && opis.count > 2 && opis.count < 31 {
                            
                            Text("Вы сохранили заметку! ⏱ \(timeRemaining)")
                                .font(.system(size: 18))
                                .foregroundColor(.white)
                                .frame(width: 300, height: 35)
                                .background(.green)
                                .cornerRadius(20)
                                .fontWeight(.bold)
                                .shadow(color: .white, radius: 8)
                                .onReceive(timer) { _ in
                                    if timeRemaining > 0 {
                                        timeRemaining -= 1
                                    } else {
                                        checkButton.toggle()
                                        timeRemaining = 3
                                        
                                        DataController().addNotes(title: title, opis: opis, priority: selectionPriority.rawValue, context: managedObjContext)
                                        dismiss()
                                        //123
                                    }
                                }
                        } else if checkButton == true {
                            Text("Вы не сохранили заметку! ⏱ \(timeRemaining)")
                                .font(.system(size: 18))
                                .foregroundColor(.white)
                                .frame(width: 300, height: 35)
                                .background(.red)
                                .cornerRadius(20)
                                .fontWeight(.bold)
                                .shadow(color: .red, radius: 8)
                                .onReceive(timer) { _ in
                                    if timeRemaining > 0 {
                                        timeRemaining -= 1
                                    } else {
                                        checkButton.toggle()
                                        timeRemaining = 3
                                        title = ""
                                        opis = ""
                                    }
                                }
                        }
                        
                    }.frame(width: 300, height: 35)
                }.padding(.bottom, 100)
                
            }
        }
    }
}

struct NotesPage_Previews: PreviewProvider {
    static var previews: some View {
        NotesPage()
    }
}




