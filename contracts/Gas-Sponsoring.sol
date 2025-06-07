
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GasSponsor {
    address public relayer;
    mapping(bytes32 => bool) public executed;

    constructor(address _relayer) { relayer = _relayer; }

    function relay(address to, bytes calldata data, bytes calldata sig) external {
        require(msg.sender == relayer, "Not relayer");
        bytes32 hash = keccak256(abi.encodePacked(to, data));
        require(!executed[hash], "Already done");
        executed[hash] = true;
        (bool ok, ) = to.call(data);
        require(ok, "Call failed");
    }
}
