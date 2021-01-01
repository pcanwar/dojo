#!/usr/bin/env python
# coding: utf-8

# In[1]:


from hashlib import sha256
from time import time
import json

class Block:
    def __init__(self, index, previousHash, transactions, timestamp=time() ):
        self.index = index
        self.previousHash = previousHash
        self.transactions = transactions
        self.timestamp = timestamp
        self.proof = 0
    
    def __repr__(self):
        return 'Index: {}, previous Hash: {}, Transactions: {} '.format(self.index, 
                                                                                   self.previousHash,
                                                                                    self.transactions)
         

    def hashBlock(self):
        blockToHash = json.dumps(self.__dict__, sort_keys=True)
        return( sha256(blockToHash.encode()).hexdigest())

class Blockchain:
    def __init__(self):
        # genesisBlock = Block(0, '', [], 1, 0)
        self.chain = []
        self.unconfirmedTransaction = []
        self.countIndex = 0    

    def createGenesisBlock(self):
        genesisBlock = {
            'index': 0,
            'previousHash': '0',
            'transactions': []
            
        }
        genesisBlock = Block(genesisBlock['index'], genesisBlock['previousHash'], genesisBlock['transactions'])
        genesisBlock.hash = genesisBlock.hashBlock()
        self.chain.append(genesisBlock)
    
    def addTx(self, sender, receiver, amount):
        tx = {
            'sender': sender,
            'receiver': receiver,
            'amount': amount
        }
        self.unconfirmedTransaction.append(tx)
    

    def addBlock(self, block):
        previousHash = self.getLastBlockchainValue.hash
        if previousHash != block.previousHash:
            return False
        block.hash = block.hashBlock()
        self.chain.append(block)
        return True

    
    def mining(self):
        lastBlock = self.getLastBlockchainValue
        
        block = {
            'index': lastBlock.index + 1,
            'previousHash': lastBlock.hash,
            'transactions': self.unconfirmedTransaction
        }
        
        newBlock = Block(block['index'], block['previousHash'], block['transactions'])
        self.addBlock(newBlock)
        
        self.unconfirmedTransaction = []
        return newBlock.index
    
    @property
    def getLastBlockchainValue(self):
        if len(self.chain) < 1:
            return None
        return(self.chain[-1])


# In[2]:


block = Blockchain()


# In[3]:


block.createGenesisBlock()


# In[4]:


block.addTx("ibrahim", "John", 3)


# In[5]:


block.unconfirmedTransaction


# In[6]:


block.mining()


# In[7]:


block.addTx("Ahmed", "Alice", 5)
block.unconfirmedTransaction


# In[8]:


for i in (block.chain):
    print (' Transaction: ', i.index, i.transactions, i.previousHash, i.hash)

