pragma solidity ^0.8.0;
 
contract YourContract {
    mapping(address => uint256) public deposits;
 
    function deposit(uint256 value) external payable {
        deposits[msg.sender] += value;
    }
 
    function withdraw(uint256 value) external {
        require(deposits[msg.sender] >= value);
        deposits[msg.sender] -= value;
        payable(msg.sender).transfer(value);
    }
}
