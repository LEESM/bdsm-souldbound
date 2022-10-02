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
    // uint public constant BIO = 101;
    // uint public constant PIC = 102;
    // uint public constant CONTACT = 103;
    // erc1155 토큰에 문자열 저장불가, 자기소개 사진주소 컨택은 외부에 저장?

    mapping (int => address) users;

    event Register(address owner);

    constructor() public ERC1155("") {
        
    }

    //회원가입시
    function register(address owner, uint _STAT1, uint _STAT2, uint _STAT3, uint _STAT4, uint _STAT5, uint _STAT6, string memory _BIO, string memory _PIC, string memory _CONTACT ) public onlyOwner{
        _mint(owner, OUT_COUNT, 0, "");
        _mint(owner, STAT1, _STAT1 , "");
        _mint(owner, STAT2, _STAT2 , "");
        _mint(owner, STAT3, _STAT3 , "");
        _mint(owner, STAT4, _STAT4 , "");
        _mint(owner, STAT5, _STAT5 , "");
        _mint(owner, STAT6, _STAT6 , "");
        // _mint(owner, BIO, _BIO , "");
        // _mint(owner, PIC, _PIC , "");
        // _mint(owner, CONTACT, _CONTACT , "");
        emit Register(msg.sender);
    }

    // 가장 두드러지는 성향 계산하기
    function sortingSexualPreference(address owner) public returns(uint) {
        uint sp = 1;
        if (balanceOf(owner, 2)>balanceOf(owner, 1)){
            sp = 2;
        } else if (balanceOf(owner, 3)>balanceOf(owner, 2)){
            sp = 3;
        } else if (balanceOf(owner, 4)>balanceOf(owner, 3)){
            sp = 4;
        } else if (balanceOf(owner, 5)>balanceOf(owner, 4)){
            sp = 5;
        } else if (balanceOf(owner, 6)>balanceOf(owner, 5)){
            sp = 6;
        }
        return sp;
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
