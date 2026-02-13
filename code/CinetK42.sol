// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.5.0
pragma solidity ^0.8.33;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract CinetK42 is ERC20, Ownable {
    uint256 public constant MAX_SUPPLY = 10_000_000 * 10 ** 18;

    constructor(
        address initialOwner
    ) ERC20("CinetK42", "FK42") Ownable(initialOwner) {
        _mint(initialOwner, MAX_SUPPLY);
    }
}
