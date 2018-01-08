import RxSwift
import RxCocoa

public protocol Action {
    associatedtype State

    func reduce(_ state: State) -> State
}

public struct AnyAction<S>: Action {
    private let reduceClosure: (S) -> S

    public init<A: Action>(_ action: A) where A.State == S {
        reduceClosure = { action.reduce($0) }
    }

    public func reduce(_ state: S) -> S {
        return reduceClosure(state)
    }
}

public typealias Middleware<S> = (_ state: S, _ action: AnyAction<S>) -> AnyAction<S>?

public class Store<S> {
    public let state: Driver<S>
    private let stateVariable: Variable<S>
    private var middlewares: [Middleware<S>] = []
    private let queue = DispatchQueue(label: "redux")

    public init(initialState: S, middlewares: [Middleware<S>] = []) {
        stateVariable = Variable(initialState)
        state = stateVariable.asDriver()
        self.middlewares = middlewares
    }

    public func dispatch<A: Action>(_ action: A) where A.State == S {
        queue.async {
            let state = self.stateVariable.value
            let action: AnyAction<S>? = self.middlewares.reduce(AnyAction(action), { (action, middleware) in
                return action.flatMap({ middleware(state, $0) })
            })

            if let action = action {
                self.stateVariable.value = action.reduce(state)
            }
        }
    }

    public func dispatch<A: Action>(_ asyncAction: () -> A) where A.State == S {
        dispatch(asyncAction())
    }
}
