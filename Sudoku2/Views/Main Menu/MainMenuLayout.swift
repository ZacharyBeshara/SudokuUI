//
//  MainMenuLayout.swift
//  Sudoku2
//
//  Created by Zachary Beshara on 1/18/22.
//

import SwiftUI

struct MainMenuLayout: View {
    @Binding var selectedPuzzleDifficulty: PuzzleMode?
    @Binding var canResume: Bool
    
    var body: some View {
        // If resume button should appear, arrange buttons depending on view size
        if canResume {
            GeometryReader { geometry in
                // If view is tall, then arrange all buttons in a vertical list
                if geometry.size.height >= geometry.size.width {
                    VStack(alignment: .center) {
                        NewGameButton(selectedPuzzleDifficulty: self.$selectedPuzzleDifficulty)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .aspectRatio(2, contentMode: .fit)
                        
                        ResumeGameButton(selectedPuzzleDifficulty: self.$selectedPuzzleDifficulty, canResume: self.$canResume)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .aspectRatio(2, contentMode: .fit)
                        
                        StatsButton()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .aspectRatio(2, contentMode: .fit)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                // If view is wide, then arrange all buttons in a grid
                else {
                    HStack(alignment: .center) {
                        VStack(alignment: .trailing) {
                            NewGameButton(selectedPuzzleDifficulty: self.$selectedPuzzleDifficulty)
                                .aspectRatio(2, contentMode: .fit)
                                .frame(maxWidth: geometry.size.width / 2, maxHeight: geometry.size.height / 2)
                            StatsButton()
                                .aspectRatio(2, contentMode: .fit)
                                .frame(maxWidth: geometry.size.width / 2, maxHeight: geometry.size.height / 2)
                        }
                        VStack(alignment: .leading) {
                            ResumeGameButton(selectedPuzzleDifficulty: self.$selectedPuzzleDifficulty, canResume: self.$canResume)
                                .aspectRatio(2, contentMode: .fit)
                                .frame(maxWidth: geometry.size.width / 2, maxHeight: geometry.size.height / 2)
                            Spacer()
                        }
                    }
                }
            }
        }
        // If resume button is hidden, then always arrange buttons in a vertical list
        else {
            VStack(alignment: .center) {
                NewGameButton(selectedPuzzleDifficulty: self.$selectedPuzzleDifficulty)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .aspectRatio(2, contentMode: .fit)
                
                StatsButton()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .aspectRatio(2, contentMode: .fit)
            }
        }
    }
}

struct MainMenuLayout_Previews: PreviewProvider {
    @State static var selectedPuzzleDifficulty: PuzzleMode? = .menu
    @State static var canResume = true
    static var previews: some View {
        MainMenuLayout(selectedPuzzleDifficulty: $selectedPuzzleDifficulty, canResume: $canResume)
    }
}
