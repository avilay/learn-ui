import logo from './logo.svg';
import './App.css';
import chrome from "./chrome";

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          My first React Chrome extension!
        </p>
        <button onClick={(e) => chrome.tabs.create({url: 'https://avilay.rocks'})}>Click Me!</button>

      </header>
    </div>
  );
}

export default App;
