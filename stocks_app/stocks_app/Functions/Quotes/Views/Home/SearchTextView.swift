//
//  stocks_appApp.swift
//  SearchTextView
//
//  Created by Ivan Vislov on 23.03.2021.
//

import SwiftUI

struct SearchTextView: View {
    
    @Binding var searchTerm: String
    
    var body: some View {
        CustomTextField(placeholder: Text("Find company").foregroundColor(Color.black), text: $searchTerm)
            .font(.custom("Montserrat-SemiBold",size: 16))
            .foregroundColor(.black)
            .padding(.leading, 70)
            .frame(height: 50)
            .background(ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 25).fill(Color("Color3"))
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 22))
                    .foregroundColor(Color.black)
                    .padding(.leading, 20)
            })
            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), lineWidth: 2))
            .padding(.vertical, 10)
            .padding(.horizontal, 3)

    }
}

struct SearchTextView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextView(searchTerm: .constant(""))
    }
}
