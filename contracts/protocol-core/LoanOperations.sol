// SPDX-License-Identifier: OrdinalDAO
pragma solidity ^0.8.10;
import {DataTypes} from "../libraries/types/DataTypes.sol";
import {CountersUpgradeable} from "@openzeppelin/contracts-upgradeable/utils/CountersUpgradeable.sol";
contract LoanOperations
{
 CountersUpgradeable.Counter private _loanIdTracker;
 mapping(string=>uint) private ordinalIdtoasset;
 mapping(uint=>DataTypes.LoanData) private loans;
 function createLoan(address _borrower,uint _amt) external returns(uint) {
     DataTypes.LoanData storage newLoan;

 }
}