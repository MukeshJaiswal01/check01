
Gas optimization In primitiveEngine.sol

G01 --->

struct SwapDetails {
        address recipient;
        bytes32 poolId;
        uint256 deltaIn;
        uint256 deltaOut;
        bool riskyForStable;
        bool fromMargin;
        bool toMargin;
        uint32 timestamp;
    }

// here the all bool variable and uint32 timestamp variable can be packed with address 
/since address is of 20 bytes this slot of memory can accomodate 12 more bytes of memory
// bool is of 1byte and and uint32 is of 4byte

struct SwapDetails {
        address recipient;
        bool riskyForStable;
        bool fromMargin;
        bool toMargin;
        uint32 timestamp;
        bytes32 poolId;
        uint256 deltaIn;
        uint256 deltaOut;
      
    }
    
    
 G02 --> int8 private unlocked = 1; this variable can be packed with  address variable declared initially in PrimitiveEngine.sol
   

