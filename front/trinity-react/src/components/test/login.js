import React from  'react';
import { Autocomplete , 
        TextField,
        Button,
        IconButton } from '@mui/material';
import { PhotoCamera } from '@mui/icons-material';
import AddLocationIcon from '@mui/icons-material/AddLocation';

import {ListItemButton,
        ListItemText,
        List,
        ListItem
        } from '@mui/material';
import CommentIcon from '@mui/material/Icon';        

import Accordion from '@mui/material/Accordion';

class Login extends React.Component{

    constructor(props){
        super(props);
        this.state = {
            logined : false
        }
    }

    render(){
        const options = [
            { label: 'The Godfather', id: 1 },
            { label: 'Pulp Fiction', id: 2 },
          ];
    
        return (
            <div>
                <Autocomplete disablePortal id="combo-box" options={options} sx={{width:300}} renderInput={(params) => <TextField {...params} label="Movies..." /> } />
                <Button variant="text">Text</Button>
                <Button variant="contained">Contained</Button>
                <Button variant="outlined">Outlined</Button>
                <Button variant="contained" disabled>Disabled</Button>
                <Button href="#text-buttons">Link</Button>
                <Button variant="contained" disableElevation>disableElevation</Button>
                <Button onClick={
                    ()=>{
                        alert('click');
                    }
                } variant="contained">Click</Button>
                <br />
                <Button variant="contained" color="primary">primary</Button>
                <Button variant="contained" color="secondary">secondary</Button>
                <Button variant="contained" color="error">error</Button>
                <Button variant="contained" color="success">success</Button>
                <br/>
                <Button variant="contained" color="success" size="small">small</Button>
                <Button variant="contained" color="success" size="medium">medium</Button>
                <Button variant="contained" color="success" size="large">large</Button>
                <br/>
                <Button variant="contained" color="primary" size="large" component="label">
                    Upload
                    <input hidden accept="image/*" multiple type="file"></input>
                </Button>
                <IconButton color="primary" aria-label="upload picture" component="label">
                    <input hidden accept="image/*" type="file"></input>
                    <PhotoCamera/>
                </IconButton>

                <br/>

                <IconButton aria-label="send" startIcon={<AddLocationIcon/>}>
                    send
                </IconButton>

                <br/>

                <ListItemButton component="a" href="#simple-list">
                    <ListItemText primary="spam"/>
                    <ListItemText primary="meat"/>
                </ListItemButton>

                <List sx={{ width: '100%', maxWidth: 360, bgcolor: 'background.paper' }}>
                {[1, 2, 3].map((value) => (
                    <ListItem
                    key={value}
                    disableGutters
                    secondaryAction={
                        <IconButton aria-label="comment">
                        <CommentIcon />
                        </IconButton>
                    }
                    >
                    <ListItemText primary={`Line item ${value}`} />
                    </ListItem>
                ))}
                </List>


            </div>
        );
    }
}

export default Login;