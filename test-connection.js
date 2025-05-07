const { Web3 } = require("web3");

async function testConnection() {
  try {
    // Connect to Ganache
    const web3 = new Web3("http://127.0.0.1:8546");

    // Get chain ID
    const chainId = await web3.eth.getChainId();
    console.log("Chain ID:", chainId);

    // Get accounts
    const accounts = await web3.eth.getAccounts();
    console.log("Available accounts:", accounts);

    // Get balance of first account
    const balance = await web3.eth.getBalance(accounts[0]);
    console.log(
      "Balance of first account:",
      web3.utils.fromWei(balance, "ether"),
      "ETH"
    );

    // Get block number
    const blockNumber = await web3.eth.getBlockNumber();
    console.log("Current block number:", blockNumber);
  } catch (error) {
    console.error("Error:", error);
  }
}

testConnection();
