//
//  MDatePicker.swift
//  7SecUI
//
//  Created by Rezaul Islam on 25/7/24.
//

import SwiftUI

public struct SSDatePicker: View {
    public var label : String
    @Binding public var dateText : String
    @State private var selectedDate = Date.now
    @State private var isClicked : Bool = false
    @State private var isDatePickerOpend : Bool = false
    
     
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat =  "dd/MM/yyyy"
        return formatter
    }
    
    public var body: some View {
        
        VStack(alignment:.leading){
            Text(label)

            if isDatePickerOpend {
                Text(dateFormatter.string(from: selectedDate))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .onTapGesture {
            isClicked.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                isDatePickerOpend = true
            }
        }
        .onChange(of: selectedDate, perform: { newValue in
            dateText = newValue.description
        })
        .sheet(isPresented: $isClicked){
            VStack {
                HStack {
                    Spacer()
                    Button("Ok") {
                        isClicked = false
                    }
                    .padding()
                }
                
                DatePicker("Select Date", selection: $selectedDate,in:Date()..., displayedComponents: .date)
                    .datePickerStyle(.graphical)
                    .frame(height: nil)
                Spacer()
            }
            
            .onAppear{
                dateText = selectedDate.description
            }
            .padding()
            .foregroundColor(.blue)
            .background(.black.opacity(0.1))
        }
    }
}

 
#Preview {
    SSDatePicker(label: "Date of Birth", dateText: .constant("") )
        .previewLayout(.sizeThatFits)
        .padding()
}
