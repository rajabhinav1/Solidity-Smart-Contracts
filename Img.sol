contract RandomSVG is ERC721URIStorage, VRFConsumerBase, Ownable {
    uint256 public tokenCounter;

    event CreatedRandomSVG(uint256 indexed tokenId, string tokenURI);
    event CreatedUnfinishedRandomSVG(uint256 indexed tokenId, uint256 randomNumber);
    event requestedRandomSVG(bytes32 indexed requestId, uint256 indexed tokenId); 
@@ -38,6 +39,10 @@ contract RandomSVG is ERC721URIStorage, VRFConsumerBase, Ownable {
        colors = ["red", "blue", "green", "yellow", "black", "white"];
    }

    function withdraw() public payable onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }

    function create() public returns (bytes32 requestId) {
        requestId = requestRandomness(keyHash, fee);
        requestIdToSender[requestId] = msg.sender;