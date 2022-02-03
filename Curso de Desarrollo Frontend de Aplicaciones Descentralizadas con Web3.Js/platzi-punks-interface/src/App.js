import Home from "./Views/home/index";
import { Route, Routes } from "react-router-dom";
//import { useEffect } from "react";
//import Web3 from "web3";
import MainLayout from "./layouts/main";

function App() {
  /*   useEffect(() => {

  forma 1 
     if (window.ethereum){
      window.ethereum
      .request ({
        method: "eth_requestAccounts",
      })
      .then ((accounts) =>console.log(accounts))
    }

    forma 2
      const web3 = new Web3(window.ethereum);
      web3.eth.requestAccounts().then(console.log); 
  }, []); */

  return (
    <MainLayout>
      <Routes>
        <Route path='/' exact element={<Home />} />
      </Routes>
    </MainLayout>
  );
}

export default App;
