//
//  ArrayStack.swift
//  Test
//
//  Created by Eremej Sumcenko on 24.05.2021.
//

import Foundation

class ArrayStack<E> {
    internal var data = [E]()
    
    func push(_ e: E) { data.append(e) }
    
    func pop() -> E? { data.popLast() }
    
    func peek() -> E? { data.last }
    
    var count: Int { data.count }
}
