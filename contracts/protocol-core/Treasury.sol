// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "./LendingLogic.sol";
import {LoanOperations} from "./LoanOperations.sol";
contract Treasury is Lending , LoanOperations{
    uint eligibleAmt;
    LoanOperations loanOperation= new LoanOperations();
       event receiveFundEvent(
     uint  indexed  amount 
   );
   event withdrawEvent(
       address  indexed borrower,
       uint indexed amount
   );
   function withdraw (uint256  _collateralVal,uint _collId,string memory _collName) public returns(uint)
   {  
    eligibleAmt = super.calculateLoanAmt( _collateralVal);
    uint loanId=loanOperation.createLoan(msg.sender,eligibleAmt);
    loanId=loanOperation.addcollateral(_collId,_collName,_collateralVal,msg.sender);
    super.requestForLoan(_collateralVal);
    payable(msg.sender).transfer(eligibleAmt);
    emit withdrawEvent(msg.sender,eligibleAmt);
    return loanId;
   }
    function rePay(uint _loanId) payable public 
   {
    uint amt = super.calculateTotalPayable();
    require(msg.value>=amt,"Repay The correct amount");
    loanOperation.repayLoan(_loanId,msg.sender);
    super.resetValue();
    emit receiveFundEvent(msg.value);
   }
     function checkPaybleAmt() public view returns(uint) 
  {
    return super.calculateInterest();
  }
    function getContractBalance() public view returns(uint)
  {
    return address(this).balance;
  }
  function fakeFund() public payable{}
   
}