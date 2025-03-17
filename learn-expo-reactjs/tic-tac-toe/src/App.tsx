import { useState } from 'react';

type SquareEntry = "X" | "O" | "";

function Square({ value, onSquareClick }: { value: SquareEntry, onSquareClick: () => void }) {
  return (
    <button
      className="square"
      onClick={onSquareClick}
    >
      {value}
    </button>
  );
}

function calculateWinner(squares: SquareEntry[]): SquareEntry {
  const lines = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ];
  for (let line of lines) {
    const [i, j, k] = line;
    if (squares[i] && squares[i] === squares[j] && squares[i] === squares[k]) {
      return squares[i];
    }
  }
  return "";
}

interface BoardProps {
  xIsNext: boolean;
  squares: SquareEntry[];
  onPlay: (nextSquares: SquareEntry[]) => void;
}

function Board({ xIsNext, squares, onPlay }: BoardProps) {
  const winner = calculateWinner(squares);
  let status = "";
  if (winner) {
    status = `Winner: ${winner}`;
  } else {
    let nextPlayer = xIsNext ? "X" : "O";
    status = `Next player: ${nextPlayer}`;
  }

  function handleClick(i: number) {
    if (calculateWinner(squares)) {
      return;
    }
    if (squares[i]) {
      return;
    }
    const nextSquares = squares.slice();
    let mark: SquareEntry = xIsNext ? "X" : "O";
    nextSquares[i] = mark;
    onPlay(nextSquares);
  }

  let board = [];
  for (let i = 0; i < 3; i++) {
    let row = [];
    for (let j = 0; j < 3; j++) {
      let cell = 3 * i + j;
      row.push(<Square key={cell} value={squares[cell]} onSquareClick={() => handleClick(cell)} />);
    }
    board.push(<div key={i} className="board-row">{row}</div>);
  }

  return (
    <>
      <div className="status">{status}</div>
      {board}
    </>
  );
}

export default function Game() {
  const [history, setHistory] = useState<SquareEntry[][]>([Array(9).fill("")]);
  const [currentMove, setCurrentMove] = useState<number>(0);

  const xIsNext = currentMove % 2 === 0;
  const currentSquares = history[currentMove];

  function handlePlay(nextSquares: SquareEntry[]) {
    const nextHistory = [...history.slice(0, currentMove + 1), nextSquares];
    setHistory(nextHistory);
    setCurrentMove(nextHistory.length - 1);
  }

  function jumpTo(nextMove: number) {
    setCurrentMove(nextMove);
  }

  const moves = history.map((squares, move) => {
    let description = "";
    if (move > 0) {
      description = `Go to move # ${move}`;
    } else {
      description = "Go to game start";
    }

    return (
      <li key={move}>
        <button onClick={() => jumpTo(move)}>{description}</button>
      </li>
    );
  })

  return (
    <div className="game">
      <div className="game-board">
        <Board xIsNext={xIsNext} squares={currentSquares} onPlay={handlePlay} />
      </div>
      <div className="game-info">
        <ol>{moves}</ol>
      </div>
    </div>
  );
}
