"""
State Pattern
https://en.wikipedia.org/wiki/State_pattern
"""


class Context:
    def __init__(self):
        self.state = State()

    def set_state(self, state):
        self.state = state

    def run(self):
        self.state.handle(self)


class State:
    def handle(self, context: Context):
        pass


# Example of a concrete State Class
class StateA(State):
    def handle(self, context: Context):
        print("state A")
        context.set_state(StateB())


class StateB(State):
    def handle(self, context: Context):
        print("state B")
        context.set_state(StateA())


if __name__ == "__main__":
    ctx = Context()
    state_a = StateA()
    state_b = StateB()
    ctx.set_state(state_a)
    print("Should print 'State A'")
    ctx.run()
    print("Should print 'State B'")
    ctx.run()
