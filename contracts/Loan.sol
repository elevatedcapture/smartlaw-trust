pragma solidity ^0.4.15;
import './Signable.sol';

contract Loan is Signable {

  uint public amount; // wei
  uint public interest;
  uint public dueDate;
  uint public startDate;

  function Loan(address _trust, uint _amount, uint _interest, uint256 secondsBeforeDue, address _signature)
      public
      Signable(_trust)
  {
      startDate = now;
      amount = _amount;
      interest = _interest;
      dueDate = now + (secondsBeforeDue * 1 seconds);
      signatures.push(_signature);
  }

  function isDue()
      public
      enabledOnly
      view
      returns (bool)
  {
      return now >= dueDate;
  }

  /**
   * should be removed for the purpose of testing
   */
  function makeOverDue(uint secondsToAdd)
      public
  {
      dueDate = dueDate - (secondsToAdd * 1 seconds);
  }

}