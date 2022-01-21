//
//  ContentView.swift
//  Sudoku2
//
//  Created by Zachary Beshara on 9/29/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var preferencesManager = PreferencesManager()
    
    var body: some View {
        MainMenu()
            .environmentObject(preferencesManager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
