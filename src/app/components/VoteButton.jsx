"use state";
import React from "react";
import { voteCandidate } from "../utils/voteCandidate";
const VoteButton = ({ id_kandidat }) => {
  const handleVote = async () => {
    try {
      let result = await voteCandidate(id_kandidat);
      console.log(result);
    } catch (err) {
      console.log(err);
    }
  };
  return (
    <button
      onClick={handleVote}
      className="inline-flex text-center  items-center px-4 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
    >
      VOTE
      <svg
        aria-hidden="true"
        className="w-4 h-4 ml-2 -mr-1"
        fill="currentColor"
        viewBox="0 0 20 20"
        xmlns="http://www.w3.org/2000/svg"
      >
        <path
          fill-rule="evenodd"
          d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z"
          clip-rule="evenodd"
        ></path>
      </svg>
    </button>
  );
};

export default VoteButton;