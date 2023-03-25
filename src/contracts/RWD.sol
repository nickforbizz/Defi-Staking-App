pragma solidity ^0.8.19;


contract RWD{
    string public name = 'Reward Token';
    string public symbol = 'RWD';
    uint256 public totalSupply = 1000000000000000000000000; // 1 million tokens
    uint8 public decimals = 18;



    event Transfer(
        address indexed _from,
        address indexed _to,
        uint _value
    );



    event Approver(
        address indexed _owner,
        address indexed _spender,
        uint _value
    );



    mapping(address => uint) public balanceOf;
    mapping(address => mapping(address => uint)) public allowance;



    constructor(){
        balanceOf[msg.sender] = totalSupply;
    }



    function transfer(address _to, uint _value) public returns (bool success){
        require(balanceOf[msg.sender] >= _value, "The value is higher than available amount");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }



    function approve(address _spender, uint256 _value) public returns (bool success){
        allowance[msg.sender][_spender] = _value;
        emit Approver(msg.sender, _spender, _value);
        return true;
    }
    


    function transferFrom(address _from, address _to, uint _value) public returns (bool success){
        require(_value <= balanceOf[_from], "The value is higher than available amount");
        require(_value <= allowance[_from][msg.sender]);
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

}