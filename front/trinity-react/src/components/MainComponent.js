import React,{Component} from 'react';
import {DISHES} from './shared/dishes';
import Menu from './components/MenuComponent';

class Main extends Component{

    constructor(props){
        super(props);
        this.state = {
            dishes : DISHES
        }
    }

    render(){
        return(
            <div>
                <Navbar dark color="primary">
                    <div className="container">
                        <NavbarBrand className="ml-auto" href="/">Rnd Fusion</NavbarBrand>
                    </div>
                </Navbar>
                <Menu dishes={this.state.dishes} />
            </div>
        );
    }
}

export default Main;