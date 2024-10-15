//
//  SearchTextField.swift
//  Weather
//
//  Created by Marc on 15/10/24.
//

import SwiftUI

struct SearchTextField: View {
    
    @Binding var searchTextFieldText: String
    var onSubmit: () -> ()
    
    var body: some View {
        
        TextField("Search", text: $searchTextFieldText)
            .onSubmit({
                
                onSubmit()
            })
            .padding()
            .background(Color("BackgroundContrastColor"))
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color("AccentColor"), lineWidth: 1)
            )
            .padding()
    }
}

#Preview {
    SearchTextField(searchTextFieldText: .constant(""), onSubmit: {})
}
