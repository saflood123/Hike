//
//  ContentView.swift
//  Hike
//
//  Created by stuart flood on 04/08/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var hikes = [
        Hike(name: "Joe's Original", photo: "tom", miles: 1),
        Hike(name: "The Real Joe's Original", photo: "walk", miles: 2),
        Hike(name: "Original Joe's", photo: "tom", miles: 3)
       ]
//    var hikes = [
//        Hike(name: "cairn" , photo:  "tom" ,miles: 6),
//        Hike(name: "walkers" , photo:  "walk" ,miles: 5)
//    ]
    var body: some View {
        NavigationStack {
           
            List(hikes) { hike in
                NavigationLink(value: hike) {
                    HikeCellView(hike: hike)
                        
                }
            }.navigationTitle("Hikes")
                .toolbar {
                    ToolbarItem ( placement: .topBarTrailing){
                        Button(action: {
                            addHike()
                        }, label: {
                            Image(systemName: "plus")
                        })
                    }
                }
                
                
            .navigationDestination(for: Hike.self) { hike in
                HikeDetailScreen(hike: hike)
                  
                }
        }
        
    }
     func addHike(){
        hikes.append(Hike(name: "Stu", photo: "tom",  miles: 1))
    }
}

#Preview {
    ContentView()
}

struct HikeCellView: View {
    
    let hike: Hike
    
    var body: some View {
        HStack(alignment: .center) {
            Image(hike.photo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 10.0, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
                .frame(width: 75, height: 75)
            
            VStack {
                Text(hike.name)
                Text("\(hike.miles.formatted()) miles")
                
            }
        }
    }
}
