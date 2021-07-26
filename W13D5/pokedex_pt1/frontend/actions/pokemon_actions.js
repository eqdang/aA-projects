// import { fetchAllPokemon } from '../util/api_util';

export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";

export const receiveAllPokemon = pokemon => ({
    type: RECEIVE_ALL_POKEMON,
    pokemon
});

export const fetchAllPokemon = pokemon => dispatch => (
    PokemonApiUtil.fetchAllPokemon(pokemon).then(pokemon => dispatch(receiveAllPokemon(pokemon)))
);

    // window.fetchAllPokemon = fetchAllPokemon;
    // window.receiveAllPokemon = receiveAllPokemon;
