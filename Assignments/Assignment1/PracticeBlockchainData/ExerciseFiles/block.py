from time import time
from utility.printed  import Printed

class Block(Printed):
    """When a block is added to the chain..."""
    def __init__(self, index, previousHash, transactions, proof, time=time()):
        self.index = index
        self.previousHash = previousHash
        self.timestamp = time
        self.transactions = transactions
        self.proof = proof
