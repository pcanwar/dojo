

from utility.hashUtility import hashBlock, hashString

class Verification:
    @staticmethod
    def validProof(transactions, lastHash, proof):
        guess = (str([tx.to_ordered_dict() for tx in transactions]) + str(lastHash) + str(proof)).encode()
        _hash = hashString(guess)
        return _hash[0:2] == '00'
        
    @classmethod
    def verifyChain(cls, blockchain):
        """ Verify all blocks in the chain and return True if proof is valid, and False otherwise."""

        for (index, block) in enumerate(blockchain):
            if index == 0:
                continue
            if block.previousHash != hashBlock(blockchain[index - 1]):
                return False
            if not cls.validProof(block.transactions[:-1], block.previousHash, block.proof):
                print('Invalid proof of work')
                return False
        return True

