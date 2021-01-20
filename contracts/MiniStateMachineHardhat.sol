// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.6.0 <0.8.0;

/*import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";*/

contract MiniStateMachine /*is Ownable*/ {

  //INITIALISATION

  uint public montant = 1;
  uint public x;
  mapping(address => uint) public balances;
  address public owner;

  constructor() public
  {
    owner=msg.sender;
  }
  event Updated (address user , uint _x);

  //FONCTION

  function setValue(uint _x) public /*onlyOwner*/
  {
    require ( msg.sender == owner, "You're not owner");
    x = _x;
    emit Updated(msg.sender, _x);
  }

  function setValuePayable(uint _x) public payable
  {
    require((montant/1000) <= balances[msg.sender], "Fonds monetaire insuffisant");
    balances[msg.sender] -= (montant/1000);
    x = _x;
    emit Updated(msg.sender, _x);
  }

  function getX() public view returns(uint){
    return x;
  }

}
