//
//  TreeManager.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 01.05.2023.
//

import Foundation

final class TreeManager {
    var tree: TreeNode
    private var currentNode: TreeNode
    private var parameters: Parameters
    
    private var questionsManager = QuestionManager.shared
    private var answersManager = AnswerManager.shared
    
    static var shared = TreeManager()
    
    private init() {
        parameters = Parameters()
        let question = questionsManager.question(for: parameters)
        let firstNode = TreeNode(.init(question: question, answer: nil), parent: nil)
        self.tree = firstNode
        self.currentNode = firstNode
        setTree()
    }
    
    func next(for answer: Answer) -> TreeNode? {
        let next = currentNode.next(for: answer)
        if next?.value.answer?.parameter.contains(.noThirdPresent) == true {
            moveToHobbieSection()
            return currentNode
        }
        if next != nil {
            currentNode = next!
        }
        return next
    }
    
    func startAgain() -> TreeNode {
        currentNode = tree
        return currentNode
    }
}

// MARK: - Tree Setter
private extension TreeManager {
    func setTree() {
        setSexLayer()
        setPersonalityLayer()
        setBudgetLayer()
        setHobbyLayer()
        setPresentsLayer()
    }
    
    func setSexLayer() {
        let params = tree.parameters()
        let sexAnswers = answersManager.answers(for: params)
        sexAnswers.forEach { answer in
            let parameters: Parameters = params + answer.parameter
            let question = questionsManager.question(for: parameters)
            tree.addChild(question: question, answer: answer)
        }
    }
    
    func setPersonalityLayer() {
        var nodesQueue = tree.getLastLayerNodes()
        while let node = nodesQueue.dequeue() {
            let personalityAnswers = answersManager.answers(for: node.parameters())
            personalityAnswers.forEach { answer in
                let parameters: Parameters = answer.parameter + node.parameters()
                let question = questionsManager.question(for: parameters)
                node.addChild(question: question, answer: answer)
            }
        }
    }
    
    func setBudgetLayer() {
        var nodesQueue = tree.getLastLayerNodes()
        while let node = nodesQueue.dequeue() {
            let budgetAnswers = answersManager.answers(for: node.parameters())
            budgetAnswers.forEach { answer in
                let parameters: Parameters = answer.parameter + node.parameters()
                let question = questionsManager.question(for: parameters)
                node.addChild(question: question, answer: answer)
            }
        }
    }
    
    func setHobbyLayer() {
        for _ in 0...2 {
            var nodesQueue = tree.getLastLayerNodes()
            while let node = nodesQueue.dequeue() {
                if let answers = answersManager.answersForCharacteristics(with: node.parameters()) {
                    answers.forEach { answer in
                        let parameters: Parameters = answer.parameter + node.parameters()
                        let question = questionsManager.question(for: parameters)
                        node.addChild(question: question, answer: answer)
                    }
                }
            }
        }
    }
    
    func setPresentsLayer() {
        for _ in 0...2 {
            var nodesQueue = tree.getLastLayerNodes()
            while let node = nodesQueue.dequeue() {
                print("Node: ", node)
                if let answers = answersManager.answersForPresents(with: node.parameters()) {
                    print("Answers: ", answers, "\n\n")
                    answers.forEach { answer in
                        let parameters: Parameters = answer.parameter + node.parameters()
                        let question = questionsManager.question(for: parameters)
                        node.addChild(question: question, answer: answer)
                    }
                }
            }
        }
    }
}

private extension TreeManager {
    func moveToHobbieSection() {
        while let node = currentNode.parent {
            if let answerParameter = node.value.answer?.parameter.characteristics,
               !answerParameter.isEmpty,
               CharacteristicsParameters.budgets.contains(answerParameter) {
                self.currentNode = node
                return
            }
            currentNode = node
        }
    }
}

