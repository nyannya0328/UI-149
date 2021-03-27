//
//  ContentView.swift
//  UI-150
//
//  Created by にゃんにゃん丸 on 2021/03/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
      
        
     LunchScrren()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct LunchScrren : View {
    @State var animate = false
    @State var endSplash = false
    var body: some View{
        
        ZStack{
            UrlView()
            
            ZStack{
                
             
                
                
                Color("c1")
                Image("large")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill : .fit)
                    .frame(width: animate ? nil : 85, height:animate ? nil : 85)
                    .scaleEffect(animate ? 3 : 1)
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: {
                animatSplash()
            })
            .opacity(endSplash ? 0 : 1)
        }
    }
    func animatSplash(){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25){
            
            withAnimation(Animation.easeOut(duration: 0.45)){
            animate.toggle()
            }
            withAnimation(Animation.easeOut(duration: 0.45)){
            endSplash.toggle()
            }
            
            
        }
    }
}
