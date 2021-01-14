from collections import OrderedDict
from utility.printed  import Printed

class Transaction(Printed):
    """When a transaction is added to a block"""
    def __init__(self, sender, receiver, amount):
        self.sender = sender
        self.receiver = receiver
        self.amount = amount

    def to_ordered_dict(self):
        """Converts into (hash) dict"""
        return OrderedDict([('sender', self.sender), ('receiver', self.receiver), ('amount', self.amount)])