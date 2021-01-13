

from utility.hashUtility import hashBlock, hashString

class Verification:
    @staticmethod
    def validProof(transactions, lastHash, proof):
        guess = (str([tx.to_ordered_dict() for tx in transactions]) + str(lastHash) + str(proof)).encode()
        _hash = hashString(guess)
        return _hash[0:2] == '00'


    @classmethod
    def verifyChain(cls, blockchain):
        """ 
        1- Verify all blocks in the chain .
        2- Verify if a proof of work is valided
        return True if it's valid, and False otherwise
        Hit: You can use enumerate() in a loop
        """

