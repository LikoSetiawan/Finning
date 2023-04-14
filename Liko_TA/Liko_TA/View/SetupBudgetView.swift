//
//  SetupBudgetView.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 09/04/23.
//

import SwiftUI


struct Segment: Identifiable, Hashable{
    var id = UUID()
    
    var title: String
    var value: Int
    var recommended: Bool
}

class SegmentsViewModel: ObservableObject{
    @Published var segments: [Segment] = [
        Segment(title: "Makanan dan Minum", value: 0, recommended: false),
        Segment(title: "Transportasi", value: 0, recommended: false),
        Segment(title: "Hobby", value: 0, recommended: false),
        Segment(title: "Kegiatan Kuliah", value: 0, recommended: false),
    ]
}


struct SetupBudgetView: View {
    
    @ObservedObject var viewModel = SegmentsViewModel()

    
    var body: some View {
        VStack(){
            VStack(spacing: 10){
                Text("Budget")
                    .fontWeight(.bold)
                    .font(.system(size: 31))
                Text("Rp.0-")
                    .fontWeight(.bold)
                    .font(.system(size: 31))
            }
            .padding(.top, 55)
            Spacer()
                .frame(height: 1)
            
            //Table Listnya dibawah sini
            
            VStack{
                List(viewModel.segments, id: \.title) { segment in
                           HStack {
                               Text(segment.title)
                               Spacer()
                               Text("Rp. \(segment.value) -")
                           }
                       }
                
                
                
            }
            
            
            
            Spacer()
            NavigationLink(destination: SetupBudgetView().navigationBarBackButtonHidden(true)){
                Text("Continue")
                    .font(.headline)
                    .frame(width: 340, height: 50)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    .background(Color("interactiveColor"))
                    .cornerRadius(15)
                
            }

        }
        .frame(maxWidth:.infinity)
        .background(Color("WhiteColor"))
    }
}

struct SegmentRow: View {
    
    @Binding var value: Int
    @Binding var title: String
    @Binding var recommended: Bool
    
    var body: some View{
        VStack(alignment: .leading) {
            HStack{
                Text(title)
                Text("\(value)")
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            Divider()
        }.listRowSeparator(.hidden)
    }
}
    



struct SetupBudgetView_Previews: PreviewProvider {
    static var previews: some View {
        SetupBudgetView()
    }
}
