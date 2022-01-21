//
//  StatsScreen.swift
//  Sudoku2
//
//  Created by Zachary Beshara on 1/7/22.
//

import SwiftUI

struct StatsScreen: View {
    @ObservedObject var dataHandler = DataHandler()
    
    // View detailing statistics of puzzles completed by user
    var body: some View {
        List {
            Section(header: Text("Easy Difficulty")) {
                StatsDetail(label: "Games Completed", statValue: dataHandler.easyGamesCompleted)
                StatsDetail(label: "Total Puzzle Time", statValue: dataHandler.easyTotalPuzzleTime)
                StatsDetail(label: "Average Puzzle Time", statValue: dataHandler.easyAveragePuzzleTime)
                StatsDetail(label: "Fastest Puzzle Time", statValue: dataHandler.easyFastestPuzzleTime)
            }
            
            Section(header: Text("Medium Difficulty")) {
                StatsDetail(label: "Games Completed", statValue: dataHandler.mediumGamesCompleted)
                StatsDetail(label: "Total Puzzle Time", statValue: dataHandler.mediumTotalPuzzleTime)
                StatsDetail(label: "Average Puzzle Time", statValue: dataHandler.mediumAveragePuzzleTime)
                StatsDetail(label: "Fastest Puzzle Time", statValue: dataHandler.mediumFastestPuzzleTime)
            }
            
            Section(header: Text("Hard Difficulty")) {
                StatsDetail(label: "Games Completed", statValue: dataHandler.hardGamesCompleted)
                StatsDetail(label: "Total Puzzle Time", statValue: dataHandler.hardTotalPuzzleTime)
                StatsDetail(label: "Average Puzzle Time", statValue: dataHandler.hardAveragePuzzleTime)
                StatsDetail(label: "Fastest Puzzle Time", statValue: dataHandler.hardFastestPuzzleTime)
            }
            
            Section(header: Text("All Difficulties")) {
                StatsDetail(label: "Games Completed", statValue: dataHandler.allGamesCompleted)
                StatsDetail(label: "Total Puzzle Time", statValue: dataHandler.allTotalPuzzleTime)
            }
        }
        .onAppear(perform: {
            self.dataHandler.updateStats()
        })
    }
}

struct StatsScreen_Previews: PreviewProvider {
    static var previews: some View {
        StatsScreen()
    }
}
