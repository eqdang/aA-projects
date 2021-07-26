import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import { fetchAllPokemon } from './util/api_util';
import { RECEIVE_ALL_POKEMON, receiveAllPokemon } from './actions/pokemon_actions';



const App = () => {
    // return <h1>Pokedex</h1>
    return (
        fetchAllPokemon(), 
        receiveAllPokemon
    )};

// window.fetchAllPokemon() = fetchAllPokemon();
// window.receiveAllPokemon = receiveAllPokemon;

document.addEventListener('DOMContentLoaded', () => {
    window.fetchAllPokemon = fetchAllPokemon;
    // window.receiveAllPokemon = receiveAllPokemon;

    const store = configureStore();
    const root = document.getElementById("root");
    ReactDOM.render(<App />, root);
});