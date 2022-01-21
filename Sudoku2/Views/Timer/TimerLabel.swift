//
//  TimerLabel.swift
//  Sudoku2
//
//  Created by Zachary Beshara on 10/14/21.
//

import SwiftUI

struct TimerLabel: View {
    @EnvironmentObject var gt: GameTimer
    
    // A label used to show puzzle duration
    var body: some View {
        Text(String(gt.timeElapsed))
            .font(.system(.title, design: .monospaced))
    }
}

struct TimerLabel_Previews: PreviewProvider {
    static var previews: some View {
        TimerLabel()
            .environmentObject(GameTimer())
    }
}
