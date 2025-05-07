// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Auth {
    struct User {
        string email;
        string phone;
        string emergencyContact;
        string emergencyEmail;
        bool isDriver;
        bool exists;
    }

    mapping(address => User) public users;
    mapping(string => address) public emailToAddress;

    event UserRegistered(address indexed userAddress, string email);
    event UserLoggedIn(address indexed userAddress);

    function register(
        string memory _email,
        string memory _phone,
        string memory _emergencyContact,
        string memory _emergencyEmail,
        bool _isDriver
    ) public {
        require(!users[msg.sender].exists, "User already exists");
        require(emailToAddress[_email] == address(0), "Email already registered");

        users[msg.sender] = User({
            email: _email,
            phone: _phone,
            emergencyContact: _emergencyContact,
            emergencyEmail: _emergencyEmail,
            isDriver: _isDriver,
            exists: true
        });

        emailToAddress[_email] = msg.sender;
        emit UserRegistered(msg.sender, _email);
    }

    function login() public view returns (bool) {
        require(users[msg.sender].exists, "User does not exist");
        return true;
    }

    function getUser(address _userAddress) public view returns (User memory) {
        require(users[_userAddress].exists, "User does not exist");
        return users[_userAddress];
    }
} 