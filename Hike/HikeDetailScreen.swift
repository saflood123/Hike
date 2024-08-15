//
//  HikeDetailScreen.swift
//  Hike
//
//  Created by stuart flood on 09/08/2024.
//

import SwiftUI


struct HikeDetailScreen: View {
    
    let hike: Hike
    @State private var zoomed: Bool = false
    
    var body: some View {
        VStack  {
            Image(hike.photo)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill: .fit)
                .onTapGesture {
                    withAnimation {
                        zoomed.toggle()
                    }
                }
            Text(hike.name)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("\(hike.miles.formatted()) miles")
            Spacer()
        }.navigationTitle(hike.name)
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack{
        HikeDetailScreen(hike: Hike(name: "cairn" , photo:  "tom" ,miles: 6))
    }
}
