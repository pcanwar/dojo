const Cars = artifacts.require("Cars");

module.exports = function(deployer) {
  deployer.deploy(Cars);
};
