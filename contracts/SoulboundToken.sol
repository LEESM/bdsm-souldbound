// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";


contract SoulboundToken is ERC1155, Ownable{
    uint public constant OUT_COUNT = 0;
    uint public constant STAT1 = 1;
    uint public constant STAT2 = 2;
    uint public constant STAT3 = 3;
    uint public constant STAT4 = 4;
    uint public constant STAT5 = 5;
    uint public constant STAT6 = 6;

    event Register(address owner);

    constructor() public ERC1155("") {
    }

    //회원가입시
    function register(address owner, uint _STAT1, uint _STAT2, uint _STAT3, uint _STAT4, uint _STAT5, uint _STAT6) public onlyOwner{
        _mint(owner, OUT_COUNT, 0, "");
        _mint(owner, STAT1, _STAT1 , "");
        _mint(owner, STAT2, _STAT2 , "");
        _mint(owner, STAT3, _STAT3 , "");
        _mint(owner, STAT4, _STAT4 , "");
        _mint(owner, STAT5, _STAT5 , "");
        _mint(owner, STAT6, _STAT6 , "");
        emit Register(msg.sender);
    }

    // 토큰 전송 막아서 소울바운드로 만들기
    function _beforeTokenTransfer(
        address operator,
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    ) internal override {
        require( from == address(0) || to == address(0));
    }

}
