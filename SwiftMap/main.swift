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
    
    /// Make the cursor prominent
    curs_set(2)
    
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
    let roomWidth = 10
    let roomHeight = 5
    
    let scrX = getmaxx(stdscr)
    let scrY = getmaxy(stdscr)
    //print("attrx \(scrx),\(scry)")
    /// Place the cursor in the middle 
    var cursorX = scrX/2
    var cursorY = scrY/2
    move(cursorX ,cursorY)
    
    refresh()
    
    var quit = false
    
    while quit == false {
        
        switch getch() {
        case KEY_UP:
//            addstr("Arrow up.")
            guard cursorY > 0 else { break }
            cursorY -= 1
        case KEY_DOWN:
//            addstr("Arrow down.")
            guard cursorY < scrY-1 else { break }
            cursorY += 1
        case KEY_LEFT:
//            addstr("Arrow left.")
            guard cursorX > 0 else { break }
            cursorX -= 1
        case KEY_RIGHT:
//            addstr("Arrow right.")
            guard cursorX < scrX+1 else { break }
            cursorX += 1
        case 114:
            let midX = Int(cursorX-roomWidth/2)
            let midY = Int(cursorY-roomHeight/2)
            drawSquare(NSRect(x: midX , y: midY, width: roomWidth, height: roomHeight))
            move(Int32(midY), Int32(midX))
            refresh()
        case 113:
            quit = true
        case 46:
            move(cursorY,cursorX)
            addstr("\(cursorX)\(cursorY)")
            refresh()
        case let(unk):
            addstr("Unknown \(unk)")
            addstr("Press q to exit")
            
        }
        
        move(cursorY ,cursorX)
    addstr("*")
        move(cursorY ,cursorX)
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
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    return NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
}

//let runLoop = NSRunLoop.currentRunLoop()
SwiftMap()
CFRunLoopRun()

