// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC721Connector.sol";

contract KryptoBird is ERC721Connector {
    string[] public kryptoBirdz;
    mapping(string => bool) _kryptoBirdExists;

    function mint(string memory _kryptoBird) public {
        require(
            !_kryptoBirdExists[_kryptoBird],
            "Error: kryptobird already exists"
        );
        // this is deprecated after ver 6.
        //uint256 _id = KryptoBirdz.push(_kryptoBird);

        kryptoBirdz.push(_kryptoBird);
        uint256 _id = kryptoBirdz.length - 1;

        _mint(msg.sender, _id);
        _kryptoBirdExists[_kryptoBird] = true;
    }

    constructor() ERC721Connector("KryptoBird", "KBIRDZ") {}
}
