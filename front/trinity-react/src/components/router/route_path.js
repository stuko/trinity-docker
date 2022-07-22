import React,{Component} from 'react';
import {Route , Routes} from 'react-router-dom';
import home from "../pages/home/home";
import { withStyles } from '@material-ui/core/styles';
import MyDrawer from "../drawer/drawer.js";

const styles = theme => ({
    hidden: {
        display: 'none'
    },
    api_body: {
      color: "black"
    },
  });

class RoutePath extends Component {
    render(){
        const { classes } = this.props
        return(
            <div>
            <MyDrawer/>
            <Routes>
                <Route exact path="/" component={home} />
            </Routes>
            </div>
        );
    }
    

}  

export default withStyles(styles)(RoutePath)
