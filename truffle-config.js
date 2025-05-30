module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8546,
      network_id: "*",
    },
  },
  compilers: {
    solc: {
      version: "0.8.0",
      settings: {
        optimizer: {
          enabled: true,
          runs: 200,
        },
      },
    },
  },
};
