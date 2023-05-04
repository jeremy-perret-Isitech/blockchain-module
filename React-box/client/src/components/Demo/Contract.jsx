import { useState } from "react";
import useEth from "../../contexts/EthContext/useEth";

function Contract() {
  const { state: { contract, accounts } } = useEth();

  const [description, setDescription] = useState();
  const [title, setTitle] = useState();
  const [endVotePeriod, setEndVotePeriod] = useState();

  const getLawDetails = async () => {
    const title = await contract.methods.getLawTitle().call({from: accounts[0]})
    setTitle(title);
    const description = await contract.methods.getLawDescription().call({from: accounts[0]})
    setDescription(description);
    const endVotePeriod = await contract.methods.getEndVoteDateTimestamp().call({from: accounts[0]})
    setEndVotePeriod(new Date(endVotePeriod * 1000).toLocaleString('en-EN', {
      month: "short",
      day: "2-digit",
      year: "numeric",
    }));
  };

  getLawDetails()

  return (
    <div>
      <span className="secondary-color">
        <h3>Law Name : {title}</h3>
        <div>
        <strong>Law description : {description}</strong>
        </div>
        <div>
        <strong>End vote period : {endVotePeriod}</strong>
        </div>
      </span>
    </div>
  );

}

export default Contract;
