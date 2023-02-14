class Subject:
    def __init__(self):
        self.state = 0
        self.observers = []

    def attach(self, observer):
        self.observers.append(observer)

    def detach(self):
        pass

    def notify(self):
        pass


class Observer:
    def update(self):
        pass
