// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.6.0 <0.8.0;

contract MiniStateMachine {

  //DECLARATIONS

  uint public montant = 1000000000000000; // 0.001 ETH
  uint public x;
  address payable public owner;
  event Updated(address user, uint _x);

  //INITIALISATION

  constructor() public
  {
    owner = msg.sender;
  }

  //FONCTIONS

  function setValue(uint _x) public
  {
    require (
        msg.sender == owner,
        "You're not owner"
        );

    x = _x;
    emit Updated(msg.sender, _x);
  }

  //MUTATEURS
  function setValuePayable(uint _x) public payable
  {
    require(
        msg.value >= montant,
        "Fonds insuffisants"
        );

    x = _x;
    owner.transfer(msg.value);
    emit Updated(msg.sender, _x);
  }

  //ACCESSEURS
  function getX() public view returns(uint){
    return x;
  }
}
