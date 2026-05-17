// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.6.0 and Community Contracts commit b0ddd27
pragma solidity ^0.8.27;

import {ERC20Freezable} from "@openzeppelin/community-contracts/token/ERC20/extensions/ERC20Freezable.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Burnable} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {ERC20FlashMint} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20FlashMint.sol";
import {ERC20Permit} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

/// @custom:security-contact admin@bloxology.site
contract Bloxology is ERC20, ERC20Burnable, Ownable, ERC20Permit, ERC20FlashMint, ERC20Freezable {
    constructor(address recipient, address initialOwner)
        ERC20("Bloxology", "BSC")
        Ownable(initialOwner)
        ERC20Permit("Bloxology")
    {
        _mint(recipient, 10000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function freeze(address user, uint256 amount) public onlyOwner {
        _setFrozen(user, amount);
    }

    // The following functions are overrides required by Solidity.

    function _update(address from, address to, uint256 value)
        internal
        override(ERC20, ERC20Freezable)
    {
        super._update(from, to, value);
    }
}
