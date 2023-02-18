pragma solidity ^0.8.17;

// import OpenZeppelin Contarcts

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract MoonShotNFT is ERC721{

    // keeps track of token ids
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    // pass the name of our NFTs token and its symbol
    constructor() ERC721("MoonShotNFT", "MSNFT"){
        console.log("This is my NFT contract. Whoa!");
    }

    // function for user to mint their NFT
    function makeAnNFT() public {

      //get current tokenId
      uint256 newItemId = _tokenIds.current();

      // mint NFT to the sender using msg.sender
      _safeMint(msg.sender, newItemId);

      // Return the NFT's metadata
      tokenURI(newItemId);

      // counter the for when the next NFT is minted
      _tokenIds.increment();

    }

      //Set NFT's metadata
    function tokenURI(uint256 _tokenId) public view override returns (string memory) {
      require(_exists(_tokenId));
      console.log("An NFT w/ ID %s has been minted to %s", _tokenId, msg.sender);
      return "INSERT_YOUR_JSON_URL_HERE";
  }
}