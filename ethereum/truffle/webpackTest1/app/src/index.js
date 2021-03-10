import Web3 from "web3";
import metaCoinArtifact from "../../build/contracts/Cars.json";

const App = {
  web3: null,
  account: null,
  meta: null,

  start: async function() {
    const { web3 } = this;

    try {
      // get contract instance
      const networkId = await web3.eth.net.getId();
      const deployedNetwork = metaCoinArtifact.networks[networkId];
      this.meta = new web3.eth.Contract(
        metaCoinArtifact.abi,
        deployedNetwork.address,
      );

      // get accounts
      const accounts = await web3.eth.getAccounts();
      this.account = accounts[0];

      // this.refreshBalance();
    } catch (error) {
      console.error("Could not connect to contract or chain.");
    }
    this.setStatus("You address is " + this.account );

  },

  // refreshBalance: async function() {
  //   const { getBalance } = this.meta.methods;
  //   const balance = await getBalance(this.account).call();

  //   const balanceElement = document.getElementsByClassName("balance")[0];
  //   balanceElement.innerHTML = balance;
  // },

  addCar: async function() {
    const { addCar } = this.meta.methods;

    const name = document.getElementById("name").value;
    const year = parseInt(document.getElementById("year").value);
    const amount = document.getElementById("amount").value;

    // this.setStatus("Initiating transaction... (please wait)");
    await addCar(name, year, amount).send({ from: this.account });
    this.setStatus("You added a car " + this.account );
  },

  fatch: async function (){
    const { fatch } = this.meta.methods;
    const id = parseInt(document.getElementById("id").value);
    await fatch(id).call().then(function(res){
      console.log(res)
    });
    
  },

  payment: async function (){
    const { payment } = this.meta.methods;
    const id = document.getElementById("id").value;
    const price = document.getElementById("price").value;

    await payment(id).send({ from: this.account, value:price }).then(function(res){
      console.log(res)
    });

    // this.setStatus("You have a new car "+ buy);

  },

  setStatus: function(message) {
    const status = document.getElementById("status");
    status.innerHTML = message;
  },
};

window.App = App;

window.addEventListener("load", function() {
  if (window.ethereum) {
    // use MetaMask's provider
    App.web3 = new Web3(window.ethereum);
    window.ethereum.enable(); // get permission to access accounts
  } else {
    console.warn(
      "No web3 detected. Falling back to http://127.0.0.1:8545. You should remove this fallback when you deploy live",
    );
    // fallback - use your fallback strategy (local node / hosted node + in-dapp id mgmt / fail)
    App.web3 = new Web3(
      new Web3.providers.HttpProvider("http://127.0.0.1:8545"),
    );
  }

  App.start();
});
