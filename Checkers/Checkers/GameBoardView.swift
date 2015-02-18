//
//  GameBoardView.swift
//  GameBoard
//
//  Created by Jeanie House on 2/18/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

import UIKit

//0 = empty
//1 = player 1
//2 = player 2
//3 =  Player1King
// 4 = Player2King





//
//enum PlayerType {
//    
//    case Empty
//    case Player1
//    case Player2
//    
//    
//    case Player1King
//    case Player2King
//    
//}
//






let boardSquares = [
   
    [0,1,0,1,0,1,0,1],
    [1,0,1,0,1,0,1,0],
    [0,1,0,1,0,1,0,1],
    [0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0],
    [2,0,2,0,2,0,2,0],
    [0,2,0,2,0,2,0,2],
    [2,0,2,0,2,0,2,0]


]

var boardPieces: [[GamePiece?]] = Array(count: 8, repeatedValue: Array (count: 8, repeatedValue: nil))




// boardSquares[0][1]

@IBDesignable class GameBoardView: UIView {

    let gridSize = 8
    
    
    
     override func layoutSubviews()   {
    
    
    
    
        
        for (rowIndex,rowArray) in enumerate (boardSquares) {
            
            for (columnIndex,squarePieceType) in enumerate(rowArray) {
    
        if squarePieceType == 0 { continue}
               
                println(squarePieceType)
                if let type = PieceType(rawValue: squarePieceType) {
                    
                    var piece = GamePiece(type: type)
                    
              //      boardPieces[rowIndex][columnIndex] = piece
                    
                    let cF = CGFloat(columnIndex)
                    let rF = CGFloat(rowIndex)
                    
                    let squareSize = frame.width / CGFloat(gridSize)
                    
                    let x = cF * squareSize + squareSize / 2
                    let y = rF * squareSize + squareSize / 2
                    
                    
                    piece.center = CGPointMake(x, y)
                    addSubview(piece)
                    
                    
                }
                
              //  var piece = GamePiece(type: PieceType.)
                
                
            }
            
            
        }
        
        
    }
  
    
    
    
    
    
    
    
    
    override func drawRect(rect: CGRect) {
        
        var context = UIGraphicsGetCurrentContext()
        
        
        //loop through columns 
        
        for c in 0..<gridSize {
            
            
  
        //then loop through rows
        
        for r in 0..<gridSize {
            
            let cF = CGFloat(c)
            let rF = CGFloat(r)
            
            let squareSize = rect.width / CGFloat(gridSize)
            
            let x = cF * squareSize
            let y = rF * squareSize
            
            let color = (c + r) % 2 == 0 ? UIColor.blackColor() : UIColor.blueColor()
            color.set()
            
            CGContextFillRect(context, CGRectMake(x, y, squareSize, squareSize))
            
        }
        
        
     }
        
        
        
        
  }
    

    
    
    
    
    
    
    
    
    
}//END
