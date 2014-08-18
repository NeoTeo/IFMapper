//
//  main.swift
//  SwiftMap
//
//  Created by Teo on 17/08/14.
//  Copyright (c) 2014 Teo. All rights reserved.
//

import Foundation


func SwiftMap() {
    
    let theScr = initscr()
    
    // Make sure keyboard input is not echoed back to the screen.
    noecho()
    // Enable cursor keypresses.
    keypad(theScr, true)
    
    addstr("Welcome to SwiftMap.")
    drawSquare(NSMakeRect(15, 5, 20, 10))
    refresh()
    
    
//    if getch() == KEY_LEFT {
//        addstr("key:")
//        refresh()
//    } else {
//        addstr("arse")
//        refresh()
//    }
    var quit = false
    
    while quit == false {
        move(0,0)
        switch getch() {
        case KEY_UP:
            addstr("Arrow up.")
        case KEY_DOWN:
            addstr("Arrow down.")
        case KEY_LEFT:
            addstr("Arrow left.")
        case KEY_RIGHT:
            addstr("Arrow right.")
        default:
            quit = true
        }
        refresh()
    }
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

