pragma solidity 0.8.0;


abstract contract T{
    
    receive() external payable{
           
       }
    
    event sent(address _adr, uint amount );
    
    function send_money( address _adr)  external{
        
       payable(_adr).transfer(address(this).balance);
       
       emit sent(msg.sender, address(this).balance );
        
    }
    
    
}

contract  Test is T{
       
       
       
       constructor() payable{
           
       }
    
    
    function bal() public view returns(uint) {
        
        return address(this).balance;
    }
    
   
    
    
}
