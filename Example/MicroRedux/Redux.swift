import MicroRedux

struct AppState {
    var counter: Int = 0
}

struct IncreaseCounter: Action {
    func reduce(_ state: AppState) -> AppState {
        var state = state
        state.counter += 1
        return state
    }
}

struct DecreaseCounter: Action {
    func reduce(_ state: AppState) -> AppState {
        var state = state
        state.counter -= 1
        return state
    }
}

let mainStore = Store(initialState: AppState())
