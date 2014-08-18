//
//  main.swift
//  SwiftMap
//
//  Created by Teo on 17/08/14.
//  Copyright (c) 2014 Teo. All rights reserved.
//

import Foundation


func SwiftMap() {
    initscr()
    addstr("Welcome to SwiftMap.")
    drawSquare(NSMakeRect(15, 5, 20, 10))
    refresh()
    getch()
    endwin()
    
    exit(1)
}

func drawSquare(theSquare :NSRect) {
    let x = Int32(theSquare.origin.x)
    let y = Int32(theSquare.origin.y)
    let cols = x+Int32(theSquare.size.width-1)
    let rows = y+Int32(theSquare.size.height-1)
    
    move(y, x)
    
    for row in y ... rows {
        for col in x ... cols {
            move(row,col)

            switch (col,row) {
            case (x,y),(cols,y),(cols,rows),(x,rows):
                addstr("+")
            case (_,rows),(_,y):
                addstr("-")
            case (x,_),(cols,_):
                addstr("|")
            default:
                addstr(" ")
            }
        }
    }
}

func input() -> String {
    var keyboard = NSFileHandle.fileHandleWithStandardInput()
    var inputData = keyboard.availableData
    return NSString(data: inputData, encoding:NSUTF8StringEncoding)
}

//let runLoop = NSRunLoop.currentRunLoop()
SwiftMap()
CFRunLoopRun()

