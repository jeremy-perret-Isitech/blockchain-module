// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract VoteContract {
    constructor(uint durationInDays, string memory _lawName, string memory _lawDescription) {
        endVoteDateTimestamp = block.timestamp + (durationInDays * 86400);
        vote = Vote(0, 0);
        lawName = _lawName;
        lawDescription = _lawDescription;
    }

    struct Vote {
        uint adoptLaw;
        uint rejectLaw;
    }

    string lawName;
    string lawDescription;

    mapping(address => address) adoptLawVoteAdressList;
    mapping(address => address) rejectLawVoteAdressList;
    mapping (address => bool) voteList;

    Vote vote;
    uint endVoteDateTimestamp;
    bool singleVotePerAdress = true;

    function canVote(address currentVoteAdress) private view {
        if(singleVotePerAdress){
            require(voteList[currentVoteAdress] == false, 'You have already voted for this law.');
        }
    }
    
    function IncAdoptLaw() public {
        canVote(msg.sender);
        vote.adoptLaw += 1;
        adoptLawVoteAdressList[msg.sender] = msg.sender;
        voteList[msg.sender] = true;
    }
    
    function IncRejectLaw() public {
        canVote(msg.sender);
        vote.rejectLaw += 1;
        rejectLawVoteAdressList[msg.sender] = msg.sender;
        voteList[msg.sender] = true;
    }

    function getEndVoteDateTimestamp() public view returns (uint) {
        return endVoteDateTimestamp;
    }

    function getVotes() public view returns (Vote memory){
        return vote;
    }

    function toggleVoteRestriction() public returns (string memory){
        singleVotePerAdress = !singleVotePerAdress;
        return singleVotePerAdress ? "Only one vote per adress" : "Multiple vote allowed";
    }

    function getLawTitle() public view returns (string memory) {
        return lawName;
    }

    function getLawDescription() public view returns (string memory) {
        return lawDescription;
    }
}

contract LawCreator {
    VoteContract[] lawVoteList;

    function createNewLawVote(uint _durationInDays, string memory _lawName, string memory _lawDescription) public {
        VoteContract lawVote = new VoteContract(_durationInDays, _lawName, _lawDescription);
        lawVoteList.push(lawVote);
    }

    function getLawVote() public view returns (VoteContract) {
        return lawVoteList[0];
    }
}