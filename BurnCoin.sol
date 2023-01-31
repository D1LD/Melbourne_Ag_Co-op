Pragma solidity ^0.8.0;

Contract token{
  mapping (address => uint) public balances;
  
  function burn(uint _value) public {
      require (balance[msg.sender] >= _value && _value > 0, "NOT enough balance.");
      balance[msg.sender] -= _value;
  }
 }
