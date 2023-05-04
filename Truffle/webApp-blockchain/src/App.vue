<script setup lang="ts">
import Web3 from 'web3';
import { reactive } from 'vue';

window.ethereum.request({ method: 'eth_accounts' })
  .then(handleAccountsChanged)
  .catch((err) => {
    console.error(err);
  });

window.ethereum.on('accountsChanged', handleAccountsChanged);

function handleAccountsChanged(accounts) {
  if (accounts[0] !== metamask) {
    metamask = accounts[0];
    connectMetamask();
  }
}

const state = reactive({ logged: false});

const web3 = new Web3('ws://localhost:7545');

var contract = new web3.eth.Contract([], "0xB74A8DD8aE7f923DBAF991cB24E399a7e50256B6");

console.log(contract)

var metamask!: string;
var walletList: string[];

web3.eth.getAccounts().then(wallets => {
  walletList = wallets;
});

const displayWalletsList = () => (
  walletList.filter(wallet => wallet.toLowerCase() !== metamask)
);

const sendETH = (to: string) => {  
  web3.eth.sendTransaction({ from: metamask, to: to, value: "1000000000000000000"})
  .then(() =>{
      console.log('Transaction Done');
      
  })
  .catch(err => console.log(err));
};

const connectMetamask = async () => {
  state.logged = false;
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
  state.logged = true;
}
</script>

<template>
  <div class="card">
    <template v-if="!state.logged">
      <button v-on:click="connectMetamask()">Connect to metamask</button>
    </template>
    <template v-else>
      <h2>Active address :</h2>
      <h3>{{ metamask }}</h3>
      <div v-for="wallet in displayWalletsList()">
      <span>
      {{ wallet }}
      <button v-on:click="sendETH(wallet)">Send 1 ETH</button>
      </span>
    </div>
    </template>
  
  </div>
</template>

<style scoped>
.logo {
  height: 6em;
  padding: 1.5em;
  will-change: filter;
  transition: filter 300ms;
}
.logo:hover {
  filter: drop-shadow(0 0 2em #646cffaa);
}
.logo.vue:hover {
  filter: drop-shadow(0 0 2em #42b883aa);
}
</style>
