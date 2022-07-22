import React , {Component}from 'react';
import logo from './logo.svg';
import './App.css';
import {Navbar, NavbarBrand} from 'reactstrap';
// import RoutePath from './components/router/route_path';
import {BrowserRouter} from 'react-router-dom';
import Login from './components/test/login';
import Main from './components/MainComponent';

class App extends Component {

  constructor(props){
    super(props);
    
  }

  render(){
    return (
      <div className="App">
        <Main />
      </div>
    );
  }
  
}

export default App;
