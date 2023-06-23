//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract TestVote {
    struct Candidate {
        uint256 id;
        string name;
        string deskripsi;
        uint256 voteCount;
    }

    // uint256 public startTime;
    uint256 public endTime;
    uint256 public candidatesCount;
    address public owner;

    mapping(uint256 => Candidate) public candidates;
    // mapping(address => bool) public registeredVoters;
    mapping(address => bool) public votedOrNot;

    event CandidateAdded(uint256 indexed id, string name);
    event VoteCast(address indexed voter, uint256 indexed candidateId);
    event VotingStarted(uint256 startTime, uint256 endTime);

    constructor() {
        owner = msg.sender;
        addCandidate("Candidate 1", "deskripsi kandidat");
        addCandidate("Candidate 2", "deskripsi kandidat");
    }

    // modifier onlyDuringVoting(){
    //     require(block.timestamp <= endTime, "Voting is not currenly active");
    //     _;
    // }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only contract owner can perform this action");
        _;
    }

    modifier notOwner() {
        require(msg.sender != owner, "Owner cannot  vote");
        _;
    }

    function addCandidate(string memory name, string memory deskripsi) public onlyOwner {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, name, deskripsi, 0);
        
        emit CandidateAdded(candidatesCount, name);
    }

    // function registerVoter(address _voter) public onlyOwner {
    //     registeredVoters[_voter] = true;
    // }

    // function startVoting (uint256 durationInSecond) public onlyOwner {
    //     require(startTime == 0, "Voting has already started");
    //     startTime = block.timestamp;
    //     endTime = startTime + durationInSecond;

    //     emit VotingStarted (startTime, 1688031349);
        
    // }

    function getBlockTime() public view returns (uint256){
        return block.timestamp;
    }

    function vote(uint256 _candidateId) public{
        // require(registeredVoters[msg.sender], "You are not registered to vote");
        require(!votedOrNot[msg.sender], "You have already voted");
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate ID");

        candidates[_candidateId].voteCount++;

        votedOrNot[msg.sender] = true;

        emit VoteCast(msg.sender, _candidateId);
    }

    function getRemainingTime() public view returns (uint256) {
            return endTime - block.timestamp;
    }
}