//
//  Queue.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 02.05.2023.
//

public struct Queue<T> {
    private var leftStack: [T] = []
    private var rightStack: [T] = []
    var count: Int {
        return leftStack.count + rightStack.count
    }
    
    public init() {}
    
    public var isEmpty: Bool {
        leftStack.isEmpty && rightStack.isEmpty
    }
    
    public var peek: T? {
        !leftStack.isEmpty ? leftStack.last : rightStack.first
    }
    
    @discardableResult public mutating func enqueue(_ element: T) -> Bool {
        rightStack.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        return leftStack.popLast()
    }
}
