//
//  ReportsView.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 17/04/23.
//

import SwiftUI


struct Bar : Identifiable{
    let id =  UUID()
    var name : String
    var pp : String
    var value : Double
    var color : Color
    
    static var sampleBars: [Bar] {
        var tempBars = [Bar]()
        var color : Color = .green
        let pp = ["Pemasukan","Pengeluaran"]
        
        for i in 1...2{
            let rand = Double.random(in: 20...200)
            
            if rand > 150{
                color = .red
            }else if rand > 75{
                color = .yellow
                }
            let bar = Bar(name: "\(i)", pp: pp[i-1],  value: rand, color: color)
            tempBars.append(bar)
            
        }
        return tempBars
    }
    
    
}

struct ReportsView: View {
    
    @State private var bars = Bar.sampleBars
    @State private var selectedID : UUID = UUID()
//    @State private var text = "info "
    
    var body: some View {
        NavigationView{
            ScrollView{
                HStack{
                    Text("Halo")
                    
                }
                
                
                
            }
            .navigationTitle("Report ")
            
        }
    }
}

struct ReportsView_Previews: PreviewProvider {
    static var previews: some View {
        ReportsView()
    }
}
