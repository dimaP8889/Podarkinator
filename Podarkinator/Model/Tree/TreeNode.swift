//
//  TreeNode.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 01.05.2023.
//

import Foundation

final class TreeNode {
    weak var parent: TreeNode?
    var value: TreeValue
    var children: [TreeNode] = []
    
    init(_ value: TreeValue, parent: TreeNode?) {
        self.value = value
        self.parent = parent
    }
    
    private func add(_ child: TreeNode) {
        children.append(child)
    }
    
    func addChild(question: Question, answer: Answer) {
        let value = TreeValue(question: question, answer: answer)
        add(TreeNode(value, parent: self))
    }
    
    func next(for answer: Answer) -> TreeNode? {
        children.first { $0.value.answer == answer }
    }
    
    func parameters() -> Parameters {
        var currentNode = self
        var parameters = currentNode.value.answer?.parameter ?? Parameters()
        while let parent = currentNode.parent {
            parameters = parameters + parent.parameters()
            currentNode = parent
        }
        
        return parameters
    }
    
    func getPresent() -> Present? {
        guard !parameters().present.isDisjoint(with: .anyPresent) else {
            return nil
        }
        return parent?.value.question.body.present
    }
    
    func getLastLayerNodes() -> Queue<TreeNode> {
        var queue = Queue<TreeNode>()
        var returnQueue = Queue<TreeNode>()
        queue.enqueue(self)
        if !children.isEmpty {
            while let node = queue.dequeue() {
                if node.children.isEmpty {
                    returnQueue.enqueue(node)
                } else {
                    node.children.forEach { queue.enqueue($0) }
                }
            }
        }
        return returnQueue
    }
}

extension TreeNode: CustomStringConvertible {
    var descriptionTest: String {
        var text = "main\n"
        var currentLevelNodes = Queue<TreeNode>()
        var nextLevelNodes = Queue<TreeNode>()
        currentLevelNodes.enqueue(self)
        
        while !currentLevelNodes.isEmpty {
            while let node = currentLevelNodes.dequeue() {
                node.children.forEach { nextLevelNodes.enqueue($0) }
                text = text + (node.value.answer?.parameter.description ?? "") + "    "
            }
            text += "\n"
            currentLevelNodes = nextLevelNodes
            while let node = nextLevelNodes.dequeue() {}
        }
        return text
    }
    
    var description: String {
        var text = ""
        forEachLevelOrder { node in
            text = text +
            String("\n----------------------\n") +
            (node.parameters().description) +
            String("\n----------------------\n")
        }
        return text
    }
    
    private func forEachLevelOrder(visit: (TreeNode) -> Void) {
        visit(self)
        var queue = Queue<TreeNode>()
        children.forEach { queue.enqueue($0) }
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach { queue.enqueue($0) }
        }
    }
}

struct TreeValue {
    var question: Question
    var answer: Answer?
}
