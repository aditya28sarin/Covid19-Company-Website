import React, {useState, useEffect} from 'react';
import {fetchDailyData} from '../../api/index';
import {Line, Bar} from 'react-chartjs-2';
import styles from './Chart.module.css';

//This is a functional Component
const Chart = ({data: {confirmed, recovered, deaths}, country}) =>{

    const [dailyData, setDailyData] = useState([]);

    //we cannot make useEffect as async and hence we need to create anothe function inside and call it async 
    useEffect(() => {

        const fetchAPI = async () => {
            const dailyData = await fetchDailyData();
            setDailyData(dailyData);
        }

        fetchAPI();
    }, []);

    //we are checking if the first day of daily data is available or fetch yet and if not then none of the other days will also be fetched and hence not do anything
              //we add two pair of curly braces, one was to make it dynamic and inner one is to make it an object 

              const lineChart = (
                dailyData.length 
                ? (
                  <Line
                    data={{
                      labels: dailyData.map(({ date }) => new Date(date).toLocaleDateString()),
                      datasets: [{
                        data: dailyData.map((data) => data.confirmed),
                        label: 'Infected',
                        borderColor: '#3333ff',
                        fill: true,
                      }, {
                        data: dailyData.map((data) => data.deaths),
                        label: 'Deaths',
                        borderColor: 'red',
                        backgroundColor: 'rgba(255, 0, 0, 0.5)',
                        fill: true,
                      },  {
                        data: dailyData.map((data) => data.recovered),
                        label: 'Recovered',
                        borderColor: 'green',
                        backgroundColor: 'rgba(0, 255, 0, 0.5)',
                        fill: true,
                      },
                      ],
                    }}
                  />
                ) : null
              );


              const barChart = (
                confirmed ? (
                  <Bar
                    data={{
                      labels: ['Infected', 'Recovered', 'Deaths'],
                      datasets: [
                        {
                          label: 'People',
                          backgroundColor: ['rgba(0, 0, 255, 0.5)', 'rgba(0, 255, 0, 0.5)', 'rgba(255, 0, 0, 0.5)'],
                          data: [confirmed.value, recovered.value, deaths.value],
                        },
                      ],
                    }}
                    options={{
                      legend: { display: false },
                      title: { display: true, text: `Current state in ${country}` },
                    }}
                  />
                ) : null
              );

    return (
       <div className={styles.container}>
           {country ? barChart : lineChart}
       </div>
    );
}

export default Chart;