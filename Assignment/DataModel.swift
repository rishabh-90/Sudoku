//
//  DataModel.swift
//  Assignment
//
//  Created by Rishabh Aggarwal on 2016-10-05.
//  Copyright © 2016 Default Profile. All rights reserved.
//

import Foundation
class DataModel
{
    var question1: [[Int]] = []
    var question2: [[Int]] = []
    var questionenabled: [[Bool]] = []
    var secondenabled: [[Bool]] = []
    var flag = 0
    var answer: [[Int]] = []
    var answer2: [[Int]] = []
    var question: [[Int]] = []
    var questionCopy: [[Int]] = []
    
    init(numItemsPerRow: Int, initialization: Int) {
        question1 = Array(count: numItemsPerRow, repeatedValue: Array(count: numItemsPerRow, repeatedValue: initialization))
        Question()
        Answer()
        
        
    }
    func Question() -> Void {
        question1 = [[0,6,0,1,0,4,0,5,0],
                [0,0,8,3,0,5,6,0,0],
                [2,0,0,0,0,0,0,0,1],
                [8,0,0,4,0,7,0,0,6],
                [0,0,6,0,0,0,3,0,0],
                [7,0,0,9,0,1,0,0,4],
                [5,0,0,0,0,0,0,0,2],
                [0,0,7,2,0,6,9,0,0],
                [0,4,0,5,0,8,0,7,0]]
        questionenabled = [[true,false,true,false,true,false,true,false,true],
                           [true,true,false,false,true,false,false,true,true],
                           [false,true,true,true,true,true,true,true,false],
                           [false,true,true,false,true,false,true,true,false],
                           [true,true,false,true,true,true,false,true,true],
                           [false,true,true,false,true,false,true,true,false],
                           [false,true,true,true,true,true,true,true,false],
                           [true,true,false,false,true,false,false,true,true],
                           [true,false,true,false,true,false,true,false,true]]
        question = question1
        questionCopy = question1
        
        question2  = [[3,7,0,0,8,0,0,0,0],
                [0,0,0,0,1,0,0,6,0],
                [0,5,0,0,0,3,0,0,0],
                [0,8,0,2,3,0,0,0,5],
                [0,0,0,0,0,0,0,9,8],
                [1,0,0,0,0,4,0,0,0],
                [2,0,0,0,0,6,0,7,3],
                [0,0,0,0,0,0,2,0,0],
                [0,0,8,0,4,0,0,0,0]]
        secondenabled  = [[false,false,true,true,false,true,true,true,true],
                 [true,true,true,true,false,true,true,false,true],
                 [true,false,true,true,true,false,true,true,true],
                 [true,false,true,false,false,true,true,true,false],
                 [true,true,true,true,true,true,true,false,false],
                 [false,true,true,true,true,false,true,true,true],
                 [false,true,true,true,true,false,true,false,false],
                 [true,true,true,true,true,true,false,true,true],
                 [true,true,false,true,false,true,true,true,true]]
        
    }
    
    func Answer()
    {
        answer = [[9,6,3,1,7,4,2,5,8],
                  [1,7,8,3,2,5,6,4,9],
                  [2,5,4,6,8,9,7,3,1],
                  [8,2,1,4,4,7,5,9,6],
                  [4,9,6,8,5,2,3,1,7],
                  [7,3,5,9,6,1,8,2,4],
                  [5,8,9,7,1,3,4,6,2],
                  [3,1,7,2,4,6,9,8,5],
                  [6,4,2,5,9,8,1,7,3]]
        
        answer2 = [[3,7,4,6,8,9,5,2,1],
                   [8,9,2,4,1,5,3,6,7],
                   [6,5,1,7,2,3,4,8,9],
                   [9,8,7,2,3,1,6,4,5],
                   [4,2,3,5,6,7,1,9,8],
                   [1,6,5,8,9,4,7,3,2],
                   [2,4,9,1,5,6,8,7,3],
                   [5,6,3,9,7,8,2,1,4],
                   [7,1,8,3,4,2,9,5,6]]
    }
    
    func check() -> Int {
        if(question1 == answer){
            
            flag = 1
        }else{
            
            flag = 0
        }
        return flag
    }
    
    func get_num(row:Int, column:Int) -> Int {
        return question1[row][column]
    }
    
    func set_num(row:Int, column:Int, value:Int) {
        question1[row][column] = value
    }
    func sortButton() -> Void
    {
        // populate grid with random numbersß
        
        for i in question1.indices {
            for j in question1.indices {
                question1[i][j] = Int(arc4random_uniform(9)+1)
                
            }
        }
        for i in question1.indices {
            question1[i].sortInPlace()
            
        }
    
    func requestion() -> Void {
        Question()
    }
    
}
    func get_data(row: Int, column:Int) -> Int {
        return questionCopy[row][column]
    }
}
