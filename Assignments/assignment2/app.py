from flask import Flask, jsonify, request
# from flask_cors import CORS
from blockchain import Blockchain
from argparse import ArgumentParser

app = Flask(__name__)
# CORS(app)


@app.route('/', methods=['GET'])
def chian():
    chain = test.chain
    dictChain = [block.__dict__.copy() for block in chain]
    for dictBlock in dictChain:
        dictBlock['transactions'] = [tx.__dict__ for tx in dictBlock['transactions']]
    return jsonify(dictChain), 200


@app.route('/mine', methods=['POST'])
def mine():
    """ mine a block """
    pass

@app.route('/opentxs', methods=['GET'])
def opentxs():
    """ get the unconfirmed transactions or any transaction has not been included in a block """
    pass

@app.route('/sendtx', methods=['POST'])
def sendtx():
    """ send a transaction"""
    pass


if __name__ == '__main__':
    ser = ArgumentParser()
    ser.add_argument('-p', '--port', default=8020)
    args = ser.parse_args()
    port = args.port
    test = Blockchain()
    app.run(debug=True, port=port)
