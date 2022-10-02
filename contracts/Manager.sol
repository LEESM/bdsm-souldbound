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

    function register(uint _STAT1, uint _STAT2, uint _STAT3, uint _STAT4, uint _STAT5, uint _STAT6) public {
        SoulboundToken(soulboundtoken).register(msg.sender, _STAT1, _STAT2, _STAT3, _STAT4, _STAT5, _STAT6);
    }

    function createMatch(address from, address to) public onlyOwner {
        Match memory newMatch = Match(from, to, true, false);
        matches.push(newMatch);
        emit Matched();
    }

    // 후보군 가져오기
    function getCandidates(address from) public {
        uint from_sp = SoulboundToken(soulboundtoken).sortingSexualPreference(from);
        uint target_sp = 1;
        if (from_sp == 1){
            target_sp = 2;
        } else if (from_sp == 3){
            target_sp = 4;
        } else if (from_sp == 4){
            target_sp = 3;
        } else if (from_sp == 5){
            target_sp = 6;
        } else if (from_sp == 6){
            target_sp = 5;
        }        
        // 유저 중 target_sp 맞는 유저 찾는 방법?
    }

    //
}
