# My token: BlackKnight
The **BlackKnight** project introduces an **ERC20** token named BlackKnight (BKN) built on the Ethereum blockchain. It leverages OpenZeppelin's secure and tested contracts for token functionality and ownership management. This contract ensures a secure and efficient token management system with the essential capabilities for minting, burning, and transferring tokens.
## Description
This project is written in Solidity programming language which is mostly used language for building smart contracts. The motivation behind creating this project was to create my own token and understand all the basic things about ERC tokens and their functionalities. This smart contract leverages the OpenZeppelin library to ensure robust and secure token functionality. This contract inherits the functionalities of ERC20 and ownable smart contracts of OpenZeppelin library and override some of them functions according to our needs. The ERC20 library is used to create tokens and perform operations on them like mint, burn, transfer, allowance, approve etc. And the ownable smart contract is basically used to work with the ownership of the smart contract inheriting it. The smart contract provides the following features:

**Minting:** Only the contract owner can mint new tokens, allowing controlled token issuance.

**Burning:** Any user can burn their tokens, reducing the total supply.

**Transfer:** Standard token transfer functionality is implemented, allowing users to transfer tokens between addresses.

## Getting Started
### Executing Program
To execute this program you can go to the Remix IDE which is open IDE for Solidity. For that you can click on this link https://remix.ethereum.org/

Once you successfully reached to the IDE create a new file by clicking on the '+' icon and saving that file with .sol extension (e.g. BlackKnight.sol). After this copy and paste the code in your file that is given below 

```solidity
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

```

After pasting this code you have to compile the code from the left hand sidebar. click on the 'Solidity Compiler' then click on the 'Compile BlackKnight.sol' button.

After the successful compilation of the code you have to deploy the program. For that you have again another option on the left sidebar that is 'Deploy & Run Transactions' and then you will see a deploy button; before clicking on it make sure that the file showing there is 'BlackKnight.sol'. Then you will be able to see the file in the 'Deployed/Unpinned Contracts' click on that now all the public variable and functions are visible to you now execute and fetch the values according to you. And be aware that here you will see the function that you have neither created nor implemented, these extra functions are the functions of the libraries we have inherited (ERC20 and ownable) and it is up to you that you gonna use them or not.

## Authors
Abhishek

## License
This project is licensed under the MIT license.
