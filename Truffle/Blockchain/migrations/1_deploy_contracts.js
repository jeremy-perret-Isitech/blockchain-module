const MetaCoin = artifacts.require("JeremyToken");
const MetaCoin1 = artifacts.require("TestContrat");
const Test = artifacts.require("Test");

module.exports = function(deployer) {
  deployer.deploy(Test);
};
