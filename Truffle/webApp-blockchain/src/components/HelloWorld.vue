<script setup lang="ts">
import Web3 from 'web3';

const web3 = new Web3('ws://localhost:7545');

const metamaskConnected = (): boolean => {
  return metamask !== undefined;
}

var metamask!: string;

const sendETH = () => {
  web3.eth.sendTransaction({ from: "0x91e996a39b46Bb4943631FE5373f9ca17FFe032D", to: "0x8fE69C19754Fac2BdaA95be430CA7424267aF370", value: "1000000000000000000"})
  .then(() =>{
      console.log('Transaction Done');
      
  }).catch(err => console.log(err));
};

const connectMetamask = async () => {
  const accounts = await window.ethereum.request({ method: 'eth_requestAccounts' })
    .catch((err) => {
      if (err.code === 4001) {
        console.log('Please connect to MetaMask.');
      } else {
        console.error(err);
      }
    });
  metamask = accounts[0];
console.log(metamask);
}
console.log(metamask);
</script>

<template>

  <div class="card">
    <template v-if="!metamaskConnected()">
      <button v-on:click="connectMetamask()">Connect to metamask</button>
    </template>
    <button v-on:click="sendETH()">Send ETH</button>
  </div>
</template>

<style scoped>
.read-the-docs {
  color: #888;
}
</style>
