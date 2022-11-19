//
//  CallStatus.swift
//  Chiper
//
//  Created by Skander Bahri on 19/11/2022.
//

public enum CallStatus<T>: Equatable {
    case none
    case called(iterations: Int, results: [T])
    
    public var isCalled: Bool {
        return self != .none
    }
    
    public var isCalledOnce: Bool {
        return callCount == 1
    }

    public var iterationCount: Int {
        switch self {
        case .none:
            return 0
        case .called(let iterations, _):
            return iterations
        }
    }
    
    public var callCount: Int {
        switch self {
        case .none:
            return 0
        case .called(_, let results):
            return results.count
        }
    }
    
    public var firstCallParam: T? {
        switch self {
        case .none:
            return nil
        case .called(_, let results):
            return results.first
        }
    }
    
    public var lastCallParam: T? {
        switch self {
        case .none:
            return nil
        case .called(_, let results):
            return results.last
        }
    }
    
    public mutating func iterate() {
        var newIterations = 1
        if case .called(let iterations, _) = self {
            newIterations = iterations + 1
        }
        self = .called(iterations: newIterations, results: [])
    }
    
    public mutating func iterate(with param: T) {
        var newIterations = 1
        var newResults: [T] = []
        if case .called(let iterations, let results) = self {
            newIterations = iterations + 1
            newResults = results
        }
        newResults.append(param)
        self = .called(iterations: newIterations, results: newResults)
    }
    
    public static func == (lhs: CallStatus, rhs: CallStatus) -> Bool {
        switch (lhs, rhs) {
        case (.none, .none):
            return true
        case (.called, .called):
            return true
        default:
            return false
        }
    }
}
