// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SoulboundToken.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Manager is Ownable{
    address public soulboundtoken;
    Match[] matches;

    struct Match{
        address from;
        address to;
        bool from_ok;
        bool to_ok;
    }

    event Matched();

    constructor(){
        soulboundtoken = address(new SoulboundToken());
    }

    function createMatch(address from, address to) public onlyOwner {
        Match memory newMatch = Match(from, to, true, false);
        matches.push(newMatch);
        emit Matched();
    }

}
