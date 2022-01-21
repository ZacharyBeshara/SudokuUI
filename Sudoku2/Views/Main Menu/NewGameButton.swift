//
//  NewGameButton.swift
//  Sudoku2
//
//  Created by Zachary Beshara on 11/22/21.
//

import SwiftUI

struct NewGameButton: View {
    @State var showDifficultySelection: Bool = false
    @Binding var selectedPuzzleDifficulty: PuzzleMode?
    
    // Button to start a new game and select puzzle difficulty
    var body: some View {
        Button(action: {
            // Toggle difficulty selection dialog
            self.showDifficultySelection.toggle()
        }) {
            HStack() {
                Text("Start New\nPuzzle")
                    .font(.title)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(Color("regularTextColor"))
                Image("New Game Icon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .padding(10)
        }
        .confirmationDialog("Select a Difficulty", isPresented: self.$showDifficultySelection) {
            Button("Easy") {
                self.selectedPuzzleDifficulty = PuzzleMode.easy
            }
            Button("Medium") {
                self.selectedPuzzleDifficulty = PuzzleMode.medium
            }
            Button("Hard") {
                self.selectedPuzzleDifficulty = PuzzleMode.hard
            }
        }
        .cornerRadius(30.0)
        .background(RoundedRectangle(cornerRadius: 30.0).fill(Color("mainColor1")))
        .overlay(RoundedRectangle(cornerRadius: 30.0).stroke(Color("regularTextColor")))
    }
}

struct MainMenuButton_Previews: PreviewProvider {
    @State static var selectedPuzzleDifficulty: PuzzleMode? = PuzzleMode.menu
    static var previews: some View {
        NewGameButton(selectedPuzzleDifficulty: $selectedPuzzleDifficulty)
    }
}
