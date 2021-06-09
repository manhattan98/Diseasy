//
//  Queue.swift
//  Diseasy
//
//  Created by Eremej Sumcenko on 09.06.2021.
//

import Foundation

class Queue<E> {
    internal class Node<E> {
        var val: E
        var next: Node<E>?
        
        init(_ e: E) { val = e }
    }
    
    internal var first: Node<E>?
    internal var last: Node<E>?
    
    func add(_ e: E) {
        if first == nil {
            last = Node(e)
            first = last
        } else {
            last!.next = Node(e)
            last = last!.next
        }
    }
    func poll() -> E? {
        defer { first = first?.next }
        return first?.val
    }
    func peek() -> E? { first?.val }
    var isEmpty: Bool { first == nil }
}
