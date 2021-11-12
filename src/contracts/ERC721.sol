// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
  BUILDING THE MINTING FUNCTION:
  ------------------------------
  a. NFT point to an address
  b. keep track of the token IDs
  c. keep track of token owner addresses to token IDs
  d. keep track of now many tokens an owner of the address has
  e. create an event that emits a transfer log - contract addres,
      where it is being minted to, the ID
*/
contract ERC721 {
    event Transfer(
        address indexed from,
        address indexed to,
        uint256 indexed tokenId
    );

    mapping(uint256 => address) private _tokenOwnder;
    mapping(address => uint256) private _ownedTokensCount;

    function _exists(uint256 tokenId) internal view returns (bool) {
        address owner = _tokenOwnder[tokenId];
        return owner != address(0);
    }

    function _mint(address to, uint256 tokenId) internal {
        require(to != address(0), "ERC721: minting to 0 address");
        require(!_exists(tokenId), "ERC721: token already minted");

        _tokenOwnder[tokenId] = to;
        _ownedTokensCount[to] += 1;

        emit Transfer(address(0), to, tokenId);
    }
}
