pragma solidity 0.4.24;


contract vehicle {
    
     
    string id;
    address owner;
    
    function vehicle(string _id) public {
        owner = msg.sender;
        id = _id;
    }
    
    function getOwner() view public returns(address) {
        return (owner);
    }
    
    function changeOwner(address newOwner) public {
        if(msg.sender == owner) {
           owner = newOwner;
        }
    }
    
}
