pragma solidity ^0.8.19;


import './Tether.sol';
import './RWD.sol';

contract DecentralBank{
    address public owner;
    string public name = "Decentral Bank";  

    Tether public tether; 
    RWD public rwd; 


    constructor(RWD _rwd, Tether _tether){
        rwd = _rwd;
        tether = _tether;
    }


}