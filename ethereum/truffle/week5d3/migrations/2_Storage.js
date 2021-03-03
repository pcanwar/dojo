const Storage = artifacts.require("SimpleStorage");

module.exports = function (deployer, network, accounts) {
  deployer.deploy(Storage)
  .then(function(instance){
    instance.set("My contract", {value: 3000000000000000000, from:accounts[0]} ).then(function(){
      instance.get().then(function(res){
        console.log(`The message is : ${res}`)
      });
    }).catch(function(err){
      console.log("error is: " + err);
    });
  }).catch(function(err){
    console.log("Deployment issue! " + err)
  });
};
