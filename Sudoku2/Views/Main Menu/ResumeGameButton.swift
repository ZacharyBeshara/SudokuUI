//
//  ResumeGameButton.swift
//  Sudoku2
//
//  Created by Zachary Beshara on 12/23/21.
//

import SwiftUI

struct ResumeGameButton: View {
    @Binding var selectedPuzzleDifficulty: PuzzleMode?
    @Binding var canResume: Bool
    
    // Button to resume a previously started puzzle
    var body: some View {
        NavigationLink(destination: GameView(puzzleMode: PuzzleMode.resume, canResume: self.$canResume, selectedPuzzleDifficulty: self.$selectedPuzzleDifficulty)) {
            HStack() {
                Text("Resume\nPuzzle")
                    .font(.title)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(Color("regularTextColor"))
                Image("Resume Game Icon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .padding(10)
        }
        .cornerRadius(30.0)
        .background(RoundedRectangle(cornerRadius: 30.0).fill(Color("mainColor2")))
        .overlay(RoundedRectangle(cornerRadius: 30.0).stroke(Color("regularTextColor")))
    }
}

struct ResumeGameButton_Previews: PreviewProvider {
    @State static var selectedPuzzleDifficulty: PuzzleMode? = PuzzleMode.menu
    @State static var canResume = false
    static var previews: some View {
        ResumeGameButton(selectedPuzzleDifficulty: self.$selectedPuzzleDifficulty, canResume: $canResume)
    }
}
