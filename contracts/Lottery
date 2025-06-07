// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract HourlyLottery {
    address[] public players;
    uint256 public lastTime;
    uint256 public constant INTERVAL = 1 hours;

    function enter() external payable {
        require(msg.value == 0.01 ether, "Require 0.01");
        players.push(msg.sender);
    }

    function draw() external {
        require(block.timestamp >= lastTime + INTERVAL, "Too early");
        uint256 idx = uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty, players.length))) % players.length;
        payable(players[idx]).transfer(address(this).balance);
        delete players;
        lastTime = block.timestamp;
    }
}
