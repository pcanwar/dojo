from utility.hashUtility import hashBlock
from utility.verification import Verification

from block import Block
from transaction import Transaction


class Blockchain:
    def __init__(self):
        genesis_block = Block(0, '', [], 0, 0)
        self.chain = [genesis_block]
        self.unconfirmedTransaction = []
        self.REWAED = 10



    @property
    def chain(self):
        return self.__chain[:]

    # The setter
    @chain.setter
    def chain(self, data):
        self.__chain = data

    def proofOfWork(self):
        """proof of work:  
        the unconfirmed transactions, the hash of the previous block and a proof guessed number """
        last_block = self.__chain[-1]
        lastHash = hashBlock(last_block)
        proof = 0
        # Try different PoW numbers and return the first valid one
        while not Verification.validProof(self.unconfirmedTransaction, lastHash, proof):
            proof += 1
        return proof

    @property
    def unconfirmed(self):
        """A list of unconfirmed transactions."""
        return self.unconfirmedTransaction[:]

    def lastChain(self):
        """last block. """
        if len(self.__chain) < 1:
            return None
        return self.__chain[-1]

    def addTransaction(self, sender, receiver, amount=0.90):
        """ Append a new transactions"""
        transaction = Transaction(sender, receiver, amount)
        self.unconfirmedTransaction.append(transaction)
        return True

    def addBlcok(self):
        """Add a new block and append unconfirmed transactions similar to a mining block"""

        last_block = self.__chain[-1]
        hashed_block = hashBlock(last_block)
        proof = self.proofOfWork()

        reward_transaction = Transaction(
            'MINING', 'receiverAddress', self.REWAED)

        copied_transactions = self.unconfirmedTransaction[:]

        copied_transactions.append(reward_transaction)

        block = Block(len(self.__chain), hashed_block,
                      copied_transactions, proof)

        block.hash = hashBlock(block)

        self.__chain.append(block)
        self.unconfirmedTransaction = []

        return block



