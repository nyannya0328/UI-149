//
//  UrlView.swift
//  UI-150
//
//  Created by にゃんにゃん丸 on 2021/03/27.
//

import SwiftUI

struct UrlView: View {
    @StateObject var model = UrlViewModel()
    @Namespace var animation
    var body: some View {
        VStack{
            
            HStack{
                
                Image(systemName: "pencil")
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 80, height: 45)
                    .foregroundColor(model.selectedTab == "pen" ? .black : .white)
                    .background(
                    
                    
                        ZStack{
                            
                            if model.selectedTab != "pen"{Color.clear}
                            else{
                                Color.white
                                    .cornerRadius(10)
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                                
                            }
                        }
                    
                    )
                    
                    .onTapGesture {
                        
                        withAnimation{
                            
                            model.selectedTab = "pen"
                        }
                        
                    }
                
                    Text("one")
                    .frame(width: 35, height: 35)
                        .background(
                        
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(model.selectedTab == "gear" ? Color.black : Color.white,lineWidth: 3)
                        )
                        
                    .foregroundColor(model.selectedTab == "gear" ? .black : .white)
                    .background(
                    
                    
                        ZStack{
                            
                            if model.selectedTab != "gear"{Color.clear}
                            else{
                                Color.white
                                    .cornerRadius(10)
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                                
                            }
                        }
                    
                    )
                   
                    .onTapGesture {
                        withAnimation{
                            
                            model.selectedTab = "gear"
                        }
                        
                        
                    }
                
                
                Image(systemName: "sun.min.fill")
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 80, height: 45)
                    .foregroundColor(model.selectedTab == "sun" ? .black : .white)
                    .background(
                    
                    
                        ZStack{
                            
                            if model.selectedTab != "sun"{Color.clear}
                            else{
                                Color.white
                                    .cornerRadius(10)
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                                
                            }
                        }
                    
                    )
                    
                    .onTapGesture {
                        withAnimation{
                            
                            model.selectedTab = "sun"
                        }
                        
                    }
                
                
                
            }
            .background(Color.white.opacity(0.15))
            .cornerRadius(10)
            .padding(.top)
            
            
            ScrollView{
                
                
                let columns = Array(repeating: GridItem(.flexible(),spacing : 10), count: 2)
                
                LazyVGrid(columns: columns,spacing: 20, content: {
                    
                    ForEach(model.urls){page in
                        
                        
                        WebView(url: page.url)
                            .opacity(model.currentpage?.id == page.id ? 0.01 : 1)
                            .frame(height: 200)
                            .cornerRadius(8)
                            .onDrag({
                                        //model.currentpage = page
                                return NSItemProvider(contentsOf: URL(string:"\(page.id)")!)!})
                            .onDrop(of: [.url], delegate: DropViewDelegate(model: model, page: page))
                    }
                    
                })
                .padding()
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.ignoresSafeArea(.all, edges: .all))
        .environmentObject(model)
    }
}

struct UrlView_Previews: PreviewProvider {
    static var previews: some View {
        UrlView()
    }
}
