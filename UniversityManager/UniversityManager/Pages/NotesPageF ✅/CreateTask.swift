//
//  CreateTask.swift
//  UniversityManager
//
//  Created by Danil Bochkarev on 26.10.2022.
//

import SwiftUI
import CoreData

struct CreateTask: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var notes : FetchedResults<Notes>
    
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundScreen()
                
                    .navigationTitle(Text("Заметки 📌"))
                
                VStack(spacing: 15) {
                    HStack {
                        Text("Создать заметку")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                            .frame(width: 305, height: 45)
                            .background(LinearGradient(gradient: Gradient(colors: [OvalTextFieldStyleHelperColor1(), OvalTextFieldStyleHelperColor2()]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .cornerRadius(20)
                            .fontWeight(.bold)
                        
                        NavigationLink(destination: NotesPage(), label: {
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
                        
                        ForEach(notes) { notes in
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 25.0)
                                
                                    .fill(Color.white)
                                    .frame(width: 340, height: 100)
                                    .aspectRatio(1.0, contentMode: .fit)
                                    .padding(.trailing)
                                
                                HStack(spacing: 15) {
                                    VStack(alignment: .leading, spacing: 3){
                                        Text(notes.title ?? "")
                                            .fontWeight(.bold)
                                            .font(.system(size: 25))
                                            .foregroundColor(.black)
                                        
                                        Text(notes.opis ?? "")
                                            .fontWeight(.medium)
                                            .font(.system(size: 14))
                                            .foregroundColor(.black)
                                        
                                    }
                                    
                                    Spacer()
                                    
                                    VStack {
                                        Text(notes.priority ?? "")
                                            .font(.system(size: 20))
                                            .foregroundColor(.black)
                                            .font(.title2)
                                            .padding(.trailing)
                                    }
                                    
                                }
                                .padding()
                            }
                            .padding()
                        }
                        .onDelete(perform: deleteNotes)
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color.red.opacity(0))
                        .padding(.leading, 10)
                        
                        
                        
                    }
                    .listRowInsets(EdgeInsets())
                    .scrollContentBackground(.hidden)
                    .padding(.top, 5)
                    .shadow(color: colorTabBarAndIcon(), radius: 4)
                    
                }
            }
            
        }
    }
    
    private func deleteNotes(offsets: IndexSet) {
        offsets.map { notes[$0] }.forEach(managedObjContext.delete)
        
        DataController().save(context: managedObjContext)
    }
    
}

struct CreateTask_Previews: PreviewProvider {
    static var previews: some View {
        CreateTask()
    }
}
