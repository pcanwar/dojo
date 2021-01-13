from utility.hashUtility import hashBlock
from utility.verification import Verification

from block import Block
from transaction import Transaction

class Blockchain:
    def __init__(self):
        genesis_block = Block(0, '', [], 0, 0)
        self.chain = [genesis_block]
        self.unconfirmedTransaction = []

    @property
    def chain(self):
        return self.__chain[:]

    # The setter
    @chain.setter
    def chain(self, data):
        self.__chain = data


    def proofOfWork(self):

         """proof of work:
        for adding the unconfirmed transactions,
        hashing the previous block and guessing a proof number """

        
        last_block = self.__chain[-1]
        lastHash = hashBlock(last_block)
        proof = 0
        while not Verification.validProof(self.unconfirmedTransaction, lastHash, proof):
            proof += 1
        return proof

    @property
    def unconfirmed(self):
        """A list of unconfirmed transactions """

    def lastChain(self):
        """last block. """
    


    def addTransaction(self, sender, receiver, amount=0.90):
        """ Append a new transaction"""
    


    def addBlcok(self):

        """Append a new block to the chain and append unconfirmed transactions, 
        it is similar to a mining block
        retrun: the new block
        """




