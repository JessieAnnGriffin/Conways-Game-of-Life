//
//  GridController.swift
//  ConwaysGameOfLife
//
//  Created by Jessie Ann Griffin on 8/20/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

import Foundation

enum State: Equatable {
    case alive, dead, neverLived
}

class Cell {
    let x: Int, y: Int
    var state: State

    init (x: Int, y: Int) {
        self.x = x
        self.y = y
        state = .neverLived
    }
}

/*
 Any live cell with two or three live neighbours survives.
 Any dead cell with three live neighbours becomes a live cell.
 All other live cells die in the next generation. Similarly, all other dead cells stay dead.
 */

// TODO: Optimize

class GridController {
    // store the number of neighborin cells that each cell has
    // set cell as alive
    // increase live neighbor counts of surrounding cells
    // Array of cells
    var cells: [Cell]
    // Grid will be 25 x 25
    let dimensions: Int = 25

    // initializer which creates an empty array of cells and then adds cells in x,y positions from 0 to 24
    init() {
        cells = [Cell]()

        for x in 0..<dimensions {
            for y in 0..<dimensions {
                cells.append(Cell(x: x, y: y))
            }
        }
    }

    // returns the cell (is it exists) at the x, y position in format [x, y] instead of a 2D array
    // using this method of filter can affect performance
    subscript (x: Int, y: Int) -> Cell? {
        return cells.filter { $0.x == x && $0.y == y }.first
    }

    func iterateCells() {
        // computed property determines whether 2 cells are adjacent
        let cellsAreNeighbors = {
            (c1: Cell, c2: Cell) -> Bool in
            let delta = (abs(c1.x - c2.x), abs(c1.y - c2.y))
            switch (delta) {
            case (1,1), (1,0), (0,1):
                return true
            default:
                return false
            }
        }

        // computed property to find the neighbors of a particular cell
        let neighborsForCell = {
            (cell: Cell) -> [Cell] in
            return self.cells.filter { cellsAreNeighbors(cell, $0) }
        }

        // computed property for living neighbors of a cell
        let livingNeighboursForCell = {
            (cell: Cell) -> Int in
            neighborsForCell(cell).filter{ $0.state == State.alive }.count
        }

        // finding dead cells
        let deadCells = cells.filter { $0.state != .alive }
        let newLivingCells =  deadCells.filter { livingNeighboursForCell($0) == 3 }

        // finding live cells
        let livingCells = cells.filter { $0.state == .alive }
        let dyingCells = livingCells.filter { livingNeighboursForCell($0) != 2 || livingNeighboursForCell($0) != 3}

        // updating the state of each cell in the gridController
        for cell in newLivingCells {
            cell.state = .alive
        }

        for cell in dyingCells {
            cell.state = .dead
        }
    }
}
