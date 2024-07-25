//
//  CreateContestEntryScreen.swift
//  7SecUI
//
//  Created by Rezaul Islam on 25/7/24.
//

import SwiftUI

struct CreateContestEntryScreen: View {
    @State var contestName : String = ""
    @State var contestDeadline : String = ""
    @State var contestRules : String = ""
    @State var contestRewards : String = ""
    
    @State private var wakeUp = Date.now
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            toolbarSection
            ScrollView(.vertical) {
                dividerSection
                uploadVideoSection
                dividerSection
                nameOfContestSection
                dividerSection
                deadLineSection
                dividerSection
                rulesSection
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(.black)
        .foregroundColor(.white)
    }
}

extension CreateContestEntryScreen{
    
    private var uploadVideoSection : some View{
        VStack(alignment: .leading){
            Button(action: {
                
            }, label: {
                HStack{
                    Image(systemName: "plus")
                    Text("Upload Video".uppercased())
                }
            })
            
            HStack{
                Spacer()
                RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                    .frame(width: 210, height: 340)
                Spacer()
            }
        }
    }
    
    private var nameOfContestSection : some View{
         
        SSTextField(label: "Name of contest".uppercased(), text: $contestName)
           
    }
    
    private var deadLineSection : some View{
        SSDatePicker(label: "Deadline".uppercased(), dateText: $contestDeadline)
    }
    
    private var rulesSection : some View{
        SSTextField(label: "Rules".uppercased(), text: $contestRules, lineLimit : 1)
    }
    
    private var toolbarSection : some View{
        Text("Create Contest Entry")
    }
    private var dividerSection : some View{
        RoundedRectangle(cornerRadius: 25.0, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
            .frame(height: 0.5)
    }
}

#Preview {
    CreateContestEntryScreen()
}
