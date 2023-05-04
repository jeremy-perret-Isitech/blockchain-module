import useEth from "../../contexts/EthContext/useEth";
import { useState } from "react";

function ContractBtns() {
  const { state: { contract, accounts } } = useEth();

  const [voteData, setVoteData] = useState({adoptLaw: "", rejectLaw: ""});

  const retreiveVoteData = async () => {
    const voteData = await contract.methods.getVotes().call({ from: accounts[0] });
    setVoteData(voteData);
    console.log(voteData);
  }


  return (
    <div>
      <button>
        UpVote
      </button>

      <button>
        downVote
      </button>
      <button>
        Create new law vote
      </button>
      <div>
        <div>
          <h4>Nomber of up vote</h4>
          <span>{ voteData['adoptLaw'] }</span>
        </div>
        <div>
          <h4>Nomber of down vote</h4>
          <span>{ voteData['rejectLaw']}</span>
        </div>
      </div>
    </div>
  );
}

export default ContractBtns;
