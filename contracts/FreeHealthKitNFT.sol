// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract FreeHealthKitNFT is ERC721URIStorage, Ownable {
    uint256 private _tokenIdCounter;
    string private constant defaultURI = "https://gateway.pinata.cloud/ipfs/bafkreifnxnsium3lumfhtajj2e2w3se3bzq7rn4dhmdjnpmogl2wa7q64i";

    constructor() ERC721("FreeHealthKitNFT", "FHK") Ownable(msg.sender) {}

    function mint(address to) public onlyOwner returns (uint256) {
        uint256 tokenId = _tokenIdCounter;
        _tokenIdCounter++;
        _safeMint(to, tokenId);
        return tokenId;
    }

    function totalSupply() public view returns (uint256) {
        return _tokenIdCounter;
    }
}