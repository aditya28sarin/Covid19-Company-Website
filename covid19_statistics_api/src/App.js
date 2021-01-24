import React from 'react';
import {Cards, Chart, CountryPicker} from './components';
import styles from './App.module.css';
import {fetchData} from './api/index';
import coronaImg from './imgs/image.png';

//This will be a simple class based component 
class App extends React.Component{

    //we dont need to make constructor and if we write state like this then it 
    //automatically creates constructor at the backend, data is initially empty but populates when component mounts 
    state = {
        data: {},
        country:'',
    }

    async componentDidMount (){
        const fetchedData = await fetchData();
        
        this.setState({data : fetchedData});
    }

    handleCountryChange = async (country) => {
        console.log(country);

        const fetchedData = await fetchData(country);

        this.setState({data : fetchedData, country : country});
    }

    render(){
        
        return(
           <div className={styles.container}>
           <img className={styles.image} src={coronaImg} alt="corona image"/>
                <Cards data = {this.state.data} />
                <CountryPicker handleCountryChange={this.handleCountryChange} />
                <Chart data={this.state.data} country ={this.state.country}/>
           </div>
        )
    }
}

export default App;