//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Banking{
    mapping (address => uint) private balances;
    event Deposit(address indexed owner, uint amount);
    event Withdraw(address indexed owner, uint amount);
    event Transfer(address indexed from, address indexed to, uint amount);

    function deposit(address _account, uint _number) public payable{
        balances[_account] += _number;
        emit Deposit(_account,_number);
    }

    function withdraw(address _account, uint _number) public payable{
        require(balances[_account]>=_number,"You are broke {:( ");
        balances[_account] -= _number;
        emit Withdraw(_account,_number);
    }

    function transfer(address _from, address _to, uint _number) public payable{
        require(balances[_from]>= _number,"Not enough funds");
        balances[_from] -= _number;
        balances[_to] += _number;
        emit Transfer(_from, _to, _number);
    }

    function getBalance(address _account)public view returns(uint){
        return  balances[_account];
    }

}
