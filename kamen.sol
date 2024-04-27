pragma solidity ^0.8.0;

contract RockPaperScissors {
    enum Move {None, Rock, Paper, Scissors}

    function play(uint256 playerMove) public view returns (string memory) {
        Move computerMove = Move(uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty))) % 3 + 1);
        Move move = Move(playerMove);

        if (move == computerMove) {
            return "Ничья!";
        } else if ((move == Move.Rock && computerMove == Move.Scissors) ||
                   (move == Move.Paper && computerMove == Move.Rock) ||
                   (move == Move.Scissors && computerMove == Move.Paper)) {
            return "Вы выиграли!";
        } else {
            return "Вы проиграли!";
        }
    }
}
