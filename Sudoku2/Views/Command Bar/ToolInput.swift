//
//  ToolInput.swift
//  Sudoku2
//
//  Created by Zachary Beshara on 10/13/21.
//

import SwiftUI

enum ToolInputAction: Int {
    case undo
    case redo
    case entryMode
    case erase
}

struct ToolInput: View {
    @EnvironmentObject var gm: GameManager
    var label: String
    var buttonAction: ToolInputAction
    
    // A button used to for a single tool function in sudoku (undo, redo, pencil/marker mode, erase)
    var body: some View {
        Button(action: {
            // Select an action to compete depending on the button's given function
            if buttonAction == .undo {
                gm.undo()
            }
            else if buttonAction == .redo {
                gm.redo()
            }
            else if buttonAction == .entryMode {
                gm.switchMode()
            }
            else if buttonAction == .erase {
                gm.erase()
            }
            else {
                raise(1)
            }
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 10).stroke(Color("regularTextColor"), lineWidth: 3)
                    .aspectRatio(2, contentMode: .fit)
                    .scaledToFill()
                
                RoundedRectangle(cornerRadius: 10)
                    .aspectRatio(2, contentMode: .fit)
                    .scaledToFill()
                    .foregroundColor(Color("mainColor1"))
                
                if buttonAction == .entryMode {
                    Text(gm.entryMode == .marker ? "Pencil" : "Marker")
                        .font(.title)
                        .scaledToFit()
                        .minimumScaleFactor(0.01)
                        .lineLimit(1)
                        .foregroundColor(Color("regularTextColor"))
                }
                else {
                    Text(label)
                        .font(.title)
                        .scaledToFit()
                        .minimumScaleFactor(0.01)
                        .lineLimit(1)
                        .foregroundColor(Color("regularTextColor"))
                }
            }
        }
    }
}

struct ToolInput_Previews: PreviewProvider {
    static var previews: some View {
        ToolInput(label: "Undo", buttonAction: ToolInputAction(rawValue: 0)!)
            .frame(width: 60, height: 30)
            .environmentObject(GameManager(puzzleMode: PuzzleMode.easy))
    }
}
