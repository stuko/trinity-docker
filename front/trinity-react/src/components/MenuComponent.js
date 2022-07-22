import React, {Component} from 'react';
import { Media } from 'reactstrap';
import {Card, CardBody, CardImg, CardImgOverlay, CardText, CardTitle}from 'reactstrap';

class Menu extends Component{
    constructor(props){
        super(props);
        this.state = {
            selectedDish: null
        }
    }

    onDishSelect(dish){
        this.setState({
            selectedDish : dish
        })
    }

    renderDish(dish){
        if(dish != null){
            return(
                <Card>
                    <CardImg width="100%" src={dish.src} alt={dish.name} />
                    <CardBody>
                        <CardTitle>{dish.name}</CardTitle>
                        <CardText>{dish.description}</CardText>
                    </CardBody>
                </Card>
            );
        }else{
            return (
                <div>

                </div>
            );
        }
    }

    render(){
        console.log(this.props.dishes);
        const menu = this.props.dishes.map((dish)=>{
            return (
                <div key={dish.id} className="col-12 col-md-5 mt-5">
                    <Card className="col-sm-3" onClick={()=>{this.onDishSelect(dish)}}>
                        <CardImg width="100%" src={dish.src} alt={dish.name} />
                        <CardImgOverlay>
                            <CardTitle>{dish.name}</CardTitle>
                        </CardImgOverlay>
                    </Card>
                </div>
            );
        });

        return(
            <div className="container">
                <div className="row">
                    {menu}
                </div>
                <div className="row mt-5">
                    {this.renderDish(this.state.selectedDish)}
                </div>
            </div>
        );
    }
}

export default Menu;

/*
export X => import {X} from filename;
export default X import K from filename; K == X
export X => import {X as K} from filename; K == X
*/