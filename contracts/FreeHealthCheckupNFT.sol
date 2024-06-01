// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract FreeHealthCheckupNFT is ERC721URIStorage, Ownable {
    uint256 private _tokenIdCounter;
    string private constant defaultURI = "https://gateway.pinata.cloud/ipfs/bafkreid7hmiiuzovblr6tplaj2okvnk32ofipaqotu7vbhbifm4iegupzm";

    constructor() ERC721("FreeHealthCheckupNFT", "FHC") Ownable(msg.sender) {}

    function mint(address to) public onlyOwner returns (uint256) {
        uint256 tokenId = _tokenIdCounter;
        _tokenIdCounter++;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, defaultURI);
        return tokenId;
    }

    function totalSupply() public view returns (uint256) {
        return _tokenIdCounter;
    }
}