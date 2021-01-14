
import hashlib
import json

def hashString(string):
    return hashlib.sha256(string).hexdigest()

def hashBlock(block):
    hashingBlock = block.__dict__.copy()
    hashingBlock['transactions'] = [tx.to_ordered_dict() for tx in hashingBlock['transactions']]
    return hashString(json.dumps(hashingBlock, sort_keys=True).encode())
