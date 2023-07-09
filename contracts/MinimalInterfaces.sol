// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.5.0;

interface IGardener {
    function whitelistFactory(address _factory, bool _listed) external;
    function whitelistFlowerbox(address _flowerbox) external ;
    function viewPayout(uint256 _lastPayoutBlock,uint256 _valueLocked) external view returns (uint256);
    function getPayout( uint256 _lastPayoutBlock, uint256 _valueLocked, address _creator, address _investor) external;
    function updateTVL(uint256 _value, bool _addingValue) external;
}

interface IVault {
    function deposit(uint256 amountWei) external;
    function withdrawAll() external;
    function withdraw(uint256 numberOfShares) external;
}

interface IRewardPool {
  function stake(uint256 amountWei) external;
  function withdraw(uint256 amountWei) external;
  function exit() external;
  function getReward() external;
}
