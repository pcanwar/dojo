### Project uses Flask that is a micro web framework

### Setup 
API Service Port Configuration:
IP:PORT e.g. http://localhost:8020


### Todos
Each endpoint should handle any error that is out of bounds

    """ Web API POST endpoint that allows to mine a block """
    @app.route('/mine', methods=['POST'])
    def mine():

    """Web API POST endpoint that allows to post a new transaction"""
    @app.route('/sendtx', methods=['POST'])
    def sendtx():
    
    {
    "sender":"Any",
    "receiver":"any",
    "amount": 8
    }

    """Web API GET endpoint request to unconfirmed transactions """
    @app.route('/opentxs', methods=['GET'])
    def opentxs():


### An Option:
    A web API responds to a request using a URL path with a block index parameter  http://127.0.0.1:8020/block/2  


### Readability:
Your project should contain a README.md file that includes instructions on the deployment of your project for the RESTful API along with its endpoints.


