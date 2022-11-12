//
//  Launch Screen.swift
//  UniversityManager
//
//  Created by Danil Bochkarev on 19.10.2022.
//

import SwiftUI

struct Launch_Screen: View {
    
    @State var animate = false
    @State var endSplash = false
    
    var body: some View {
        
        ZStack {
            
// MARK: - после загрузки идет контент
            Home()

            ZStack {
                backgroundScreen()
                
                Image("logolarge")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill : .fit)
                    .frame(width: animate ? nil : 85, height: animate ? nil : 85)
                
                    .scaleEffect(animate ? 3 : 1)
                
                    .frame(width: UIScreen.main.bounds.width)
                    
            }
            
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: animateSplash)
            
            .opacity(endSplash ? 0 : 1)
        }
    }
    
    func animateSplash() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            
            withAnimation(Animation.easeOut(duration: 0.55)) {
                animate.toggle()
            }
            
            withAnimation(Animation.linear(duration: 0.45)) {
                endSplash.toggle()
            }
        }
    }
}

struct Launch_Screen_Previews: PreviewProvider {
    static var previews: some View {
        Launch_Screen()
    }
}


