pragma solidity ^0.5.0;

contract Voting {
    struct Candidate {
        string name;
        uint voteCount;
    }

    mapping(string => uint) public candidates;
    address public owner;
    address[] public voters;
    Candidate[] public candidateList;

    constructor() public {
        owner = msg.sender;
    }

    function addCandidate(string memory name) public {
        require(msg.sender == owner);
        candidates[name] = 0;
        candidateList.push(Candidate(name, 0));
    }

    function vote(string memory name) public {
        require(msg.sender.balance >= 1 ether);
        require(voters.push(msg.sender) == 1);
        require(candidates[name] != 0);
        candidates[name] += 1;
    }

    function getCandidateVoteCount(string memory name) public view returns (uint) {
        return candidates[name];
    }

    function getWinner() public view returns (string memory) {
        string memory winner = "";
        uint maxVotes = 0;
        for (uint i = 0; i < candidateList.length; i++) {
            if (candidateList[i].voteCount > maxVotes) {
                winner = candidateList[i].name;
                maxVotes = candidateList[i].voteCount;
            }
        }
        return winner;
    }
