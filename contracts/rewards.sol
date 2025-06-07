// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Faucet {
    mapping(address => uint256) public lastRequest;
    uint256 public constant WAIT = 1 days;

    receive() external payable {}

    function request() external {
        require(block.timestamp - lastRequest[msg.sender] >= WAIT, "Too soon");
        lastRequest[msg.sender] = block.timestamp;
        payable(msg.sender).transfer(0.01 ether);
    }
}
