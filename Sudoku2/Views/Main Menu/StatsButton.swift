//
//  StatsButton.swift
//  Sudoku2
//
//  Created by Zachary Beshara on 1/7/22.
//

import SwiftUI

struct StatsButton: View {
    // Button to present the statistics page
    var body: some View {
        NavigationLink(destination: StatsScreen()) {
            HStack {
                Text("Puzzle\nStats")
                    .font(.title)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(Color("regularTextColor"))
                Image("Stats Icon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .padding(10)
        }
        .cornerRadius(30.0)
        .background(RoundedRectangle(cornerRadius: 30.0).fill(Color("mainColor3")))
        .overlay(RoundedRectangle(cornerRadius: 30.0).stroke(Color("regularTextColor")))
    }
}

struct StatsButton_Previews: PreviewProvider {
    static var previews: some View {
        StatsButton()
    }
}
