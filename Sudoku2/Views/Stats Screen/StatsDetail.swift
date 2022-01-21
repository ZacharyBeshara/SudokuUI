//
//  StatsDetail.swift
//  Sudoku2
//
//  Created by Zachary Beshara on 1/7/22.
//

import SwiftUI

struct StatsDetail: View {
    var label: String = "Test Label"
    var statValue: String = "Test Value"
    
    // A view used by the statistics screen to list a statistic label and value
    var body: some View {
        HStack {
            Text(label)
            Spacer()
            Text(statValue)
        }
    }
}

struct StatsDetail_Previews: PreviewProvider {
    static var previews: some View {
        StatsDetail(label: "Test Value", statValue: "0")
    }
}
