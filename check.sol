pragma solidity 0.8.0;

contract Receiver {
    event Received(address caller, uint amount, string message);

    fallback() external payable {
        emit Received(msg.sender, msg.value, "Fallback was called");
    }

    function foo(string memory _message, uint _x) public  returns (uint) {
        

        return _x + 1;
    }
}

contract Caller {
    

   
    function testCallFoo(address _addr) public returns(string memory)  {
        
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("foo(string,uint256)", "call foo", 123)
        );
        
        if(!success){
           
          revertBytes(data);
        }
        
        
    }
    
    
    function _getRevertMsg(bytes memory _returnData) internal pure returns (string memory) {
    // If the _res length is less than 68, then the transaction failed silently (without a revert message)
   // if (_returnData.length < 68) return 'Transaction reverted silently';

    assembly {
        // Slice the sighash.
        _returnData := add(_returnData, 0x04)
    }
    return abi.decode(_returnData, (string)); // All that remains is the revert string
}

    
    
     function revertBytes(bytes memory errMsg) internal pure {
        if (errMsg.length > 0) {
            assembly {
                revert(add(32, errMsg), mload(errMsg))
            }
        }

        revert("e/empty-error");
    }
    
       

    
}
