import axios from 'axios';  //Used to make API requests

const url= 'https://covid19.mathdro.id/api';

export const fetchData = async (country) => {

    //we are making a non-cons tchangeable url that we would want to change for each country 
    let changeableUrl = url;

    if(country)
    {
        changeableUrl = `${url}/countries/${country}`
    }

    try{

        // destructure data from response 
        const {data} =await axios.get(changeableUrl);
        
        //creating an object of those data that we need 
        const modifiedData={
            confirmed: data.confirmed,
            recovered: data.recovered,
            deaths: data.deaths,
            lastUpdate:data.lastUpdate,
        }

        return modifiedData;
    }
    catch(error){
        console.log(error);
    }
}

export const fetchDailyData = async () => {
    try{
        const {data} = await axios.get(`${url}/daily`);

        const modifiedData = data.map((dailyData) => ({
            confirmed: dailyData.confirmed.total,
            deaths: dailyData.deaths.total,
            date: dailyData.reportDate,
        }));
        return modifiedData;
    } catch (error) {
        console.log(error);
    }
}

export const fetchCountries = async () => {
    try{
        const {data: {countries}} =await axios.get(`${url}/countries`);
        return (countries.map((country)=>country.name))
    } catch (err) {
        console.log(err);   
    }
}