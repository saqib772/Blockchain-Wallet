pragma solidity ^0.8.0;

contract Wallet {
    // state variables
    address public owner;
    mapping(address => uint256) public balances;

    // events
    event Deposit(address indexed from, uint256 value);
    event Withdrawal(address indexed to, uint256 value);

    // constructor
    constructor() {
        owner = msg.sender;
    }

    // functions
    function deposit() public payable {
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(address payable to, uint256 value) public {
        require(balances[msg.sender] >= value, "Insufficient balance");
        balances[msg.sender] -= value;
        to.transfer(value);
        emit Withdrawal(to, value);
    }

    function convertToFiat(uint256 value) public {
        // implement conversion to fiat logic here
    }
}
