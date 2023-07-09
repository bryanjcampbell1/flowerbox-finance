// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.6.0;

import "./Flowerbox.sol";
import "./GardenerV1.sol";

contract FlowerboxFactory {

    Gardener public gardener;
    uint256 public TVL;
    address public gardenerAddress;
    address public lastFlowerboxCreated;
    address public treasury;

    event NewFlowerbox(
        address _flowerboxAddress,
        address _creator
    );

    constructor(address _gardenerAddress, address _treasury) public {
       gardenerAddress = _gardenerAddress;
       gardener = Gardener(_gardenerAddress);
       treasury = _treasury;
    }

    function newFlowerbox(
        uint256 _creatorDeposit,
        uint256 _investorDeposit,
        uint256 _lockDurationInBlocks,
        address _asset,
        address _harvestVault,
        address _rewardsPool
    ) public  {
        Flowerbox f = new Flowerbox(
            _creatorDeposit,
            _investorDeposit,
            _lockDurationInBlocks,
            msg.sender,
            _asset,
            _harvestVault,
            _rewardsPool,
            gardenerAddress,
            treasury
        );

        emit NewFlowerbox(address(f), msg.sender);
        lastFlowerboxCreated = address(f);

        //Allow flowerbox to request the minting of PETALS rewards
        gardener.whitelistFlowerbox(address(f));
    }
}
