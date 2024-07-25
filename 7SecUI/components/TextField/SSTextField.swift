//
//  SSTextField.swift
//  7SecUI
//
//  Created by Rezaul Islam on 25/7/24.
//

import SwiftUI

struct SSTextField: View {
    let label : String
    @Binding var text : String
    var lineLimit : Int = 0
    @State private var isVisible : Bool = false
    @FocusState private var focusPointer : Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text(label)
                .frame(maxWidth: .infinity, alignment: .leading)
                .onTapGesture {
                    withAnimation {
                        if text.count == 0{
                            isVisible.toggle()
                            focusPointer = true
                        }
                    }
                }
            if isVisible{
                if lineLimit == 0 {
                    TextField("", text: $text)
                        .focused($focusPointer)
                        .autocorrectionDisabled()
                        .padding(.vertical,8)
                        .padding(.horizontal, 4)
                        .background(.white.opacity(0.01))
                        .cornerRadius(4)
                }else{
                    TextField("", text: $text, axis: .vertical)
                        //.lineLimit(lineLimit)
                        .focused($focusPointer)
                        .autocorrectionDisabled()
                        .padding(.vertical,8)
                        .padding(.horizontal, 4)
                        .background(.white.opacity(0.01))
                        .cornerRadius(4)
                }
            }
        }
        .onChange(of: text.count) { newValue in
            if newValue == 0 {
                withAnimation {
                    isVisible = false
                    focusPointer = false
                }
            }
        }
    }
}

#Preview {
    VStack{
        Spacer()
        SSTextField(label: "Name of contest", text: .constant(""))
            
        Spacer()
    }.background(.black)
        .foregroundColor(.white)
}
