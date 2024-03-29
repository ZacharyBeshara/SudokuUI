//
//  MainMenu.swift
//  Sudoku2
//
//  Created by Zachary Beshara on 11/22/21.
//

import SwiftUI

struct MainMenu: View {
    @State var selectedPuzzleDifficulty: PuzzleMode?
    @State var canResume: Bool
    
    init() {
        let defaults = UserDefaults.standard
        defaults.register(defaults: ["canResumePuzzle": false,
                                     "easyGamesCompleted": 0,
                                     "mediumGamesCompleted": 0,
                                     "hardGamesCompleted": 0,
                                     "easyTotalPuzzleTime": 0,
                                     "mediumTotalPuzzleTime": 0,
                                     "hardTotalPuzzleTime": 0,
                                     "easyFastestPuzzleTime": 362439,
                                     "mediumFastestPuzzleTime": 362439,
                                     "hardFastestPuzzleTime": 362439,
                                     "automaticallyClearPencilEntries": true,
                                     "highlightConflicts": true,
                                     "highlightLikeNumbers": true])
        
        self.selectedPuzzleDifficulty = .menu
        self.canResume = defaults.bool(forKey: "canResumePuzzle")
    }
    
    var body: some View {
        NavigationView {
            VStack() {
                MainMenuLayout(selectedPuzzleDifficulty: self.$selectedPuzzleDifficulty, canResume: self.$canResume)
                
                // NavigationLink to start new easy game when selected by NewGameButton
                NavigationLink(destination: GameView(puzzleMode: PuzzleMode.easy, canResume: self.$canResume, selectedPuzzleDifficulty: self.$selectedPuzzleDifficulty), tag: PuzzleMode.easy, selection: self.$selectedPuzzleDifficulty) {}
                
                // NavigationLink to start new medium game when selected by NewGameButton
                NavigationLink(destination: GameView(puzzleMode: PuzzleMode.medium, canResume: self.$canResume, selectedPuzzleDifficulty: self.$selectedPuzzleDifficulty), tag: PuzzleMode.medium, selection: self.$selectedPuzzleDifficulty) {}
                
                // NavigationLink to start new hard game when selected by NewGameButton
                NavigationLink(destination: GameView(puzzleMode: PuzzleMode.hard, canResume: self.$canResume, selectedPuzzleDifficulty: self.$selectedPuzzleDifficulty), tag: PuzzleMode.hard, selection: self.$selectedPuzzleDifficulty) {}

                Spacer()
            }
            .padding(15)
            .navigationTitle("Sudoku")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(trailing: NavigationLink(destination: SettingsView()) {
                Image(systemName: "gearshape")
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}
