// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFTPLATZI is ERC721, ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    string[] uriData = ["https://gateway.pinata.cloud/ipfs/QmeJHjTMhC3RqxMC1UQSnmQL1y7BwwVT431ugKFzCrh9du",
    "https://gateway.pinata.cloud/ipfs/QmdEdF5FkPpsN2DAHzuLtGudXD25AquRik2y5KnfFz1sew"];
    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("NFTPLATZI", "PLTZ") {}

    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uriData[0]);
    }

    function changeData(uint _tokenId) public{
        _setTokenURI(_tokenId, uriData[1]);
    }

    // The following functions are overrides required by Solidity.

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }
}