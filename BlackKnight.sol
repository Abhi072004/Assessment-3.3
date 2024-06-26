// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.25;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/access/Ownable.sol";

contract BlackNight is ERC20, Ownable {
    string constant tokenName = "BlackKnight";
    string constant Symbol = "BKN";

    constructor() ERC20(tokenName, Symbol) {
        // Initialize the token with a total supply of 1000 tokens
        _mint(owner(), 1000 * (10 ** decimals()));
    }

    function decimals() public virtual override view returns(uint8){
        return 0;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        _transfer(msg.sender, to, amount);
        return true;
    }
}
