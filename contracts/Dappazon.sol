// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Dappazon {
    string public name;
    address public owner;

    struct Item {
        uint256 id;
        string name;
        string category;
        string image;
        uint256 cost;
        uint256 rating;
        uint256 stock; 
    }

    mapping(uint256 => Item) public items;

    event List(string name, uint256 cost, uint256 quantity);

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    constructor() {
        name = "Dappazon";
        owner = msg.sender;

    }

    // List products
    function list(
        uint256 _id, 
        string memory _name, 
        string memory _category, 
        string memory _image, 
        uint256 _cost, 
        uint256 _rating, 
        uint256 _stock
    ) public onlyOwner {
        
        // Create Item struct
        Item memory item = Item (
            _id,
            _name,
            _category,
            _image,
            _cost,
            _rating,
            _stock
        );

        // Save Item struct to blockchain
        items[_id] = item;

        // Emit an event
        emit List(_name, _cost, _stock);

    }

    // Buy product
    
}
