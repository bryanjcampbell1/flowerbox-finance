// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.12;

import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";

/// @title Petals Token
/// @author strangequark.eth
/// @notice Reward token for adding liquidity to Flowerbox Finance
contract PetalsToken is ERC20("Petals Token", "PETALS") {

	address public owner;

	/// @dev Refrence to the Gardener contract. Only Gardener can mint PETALS.
	address public gardener;

	modifier onlyOwner() {
		require(msg.sender == owner, "Only the contract owner can call this function");
		_;
	}

	constructor() public {
		admin = msg.sender;
	}

	function setAdmin(address _newAdmin) public onlyOwner {
		admin = _newAdmin;
	}

	function setGardener(address _newGardener) public onlyOwner {
		gardener = _newGardener;
	}

	function mint(address _mintTo, uint256 _amount) public {
		require(msg.sender == gardener, "Only the Gardener contract can call this function");
		_mint(_mintTo, _amount);
	}

}
