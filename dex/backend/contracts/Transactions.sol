//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Transactions {

    uint256 transactionCount;
    //global total kitna transaction huaa

    event Transfer(address from, address reciever, uint amount, string message, uint timestamp);
    //timstamp works under the hood to record kab trransaction hua

    struct TransferStruct {
        address from;
        address reciever;
        uint amount;
        string message;
        uint timestamp;


    }
    //basically an array of transfer struct,
    TransferStruct[] transactions;

    //add a transaction to the blockchain, 
    function addToBlockchain(address payable receiver, uint amount, string memory message) public {
        transactionCount += 1;
        transactions.push(TransferStruct(msg.sender, receiver, amount, message, block.timestamp));

        emit Transfer(msg.sender, receiver, amount, message, block.timestamp);
    }

    function getAllTransactions() public view returns (TransferStruct[] memory) {
        return transactions;
    }

    function getTransactionCount() public view returns (uint256) {
        return transactionCount;
    }









}
