// SPDX-License-Identifier: OrdinalDAO
pragma solidity ^0.8.10;

library DataTypes {
    enum LoanState
    {
        CREATED,
        ACTIVE,
        REPAID,
        DEFAULTED
    }
    enum OrdinalState
    {
        STAKED,
        REPAID,
        DEFAULTED
    }
    struct Ordinal
    {
        uint id; // escrow id from deeplake
        string collection_name;
        uint priceWhenBorrowed;
        address staker;
        address owner; // changes to smart contract address when staked
        OrdinalState state; 

    }
    struct LoanData
    {
        uint loanId;
        address borrower;
        uint borrowedAmount;
        LoanState state;
    }

}