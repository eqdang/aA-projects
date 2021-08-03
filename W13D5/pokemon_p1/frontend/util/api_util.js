export function fetchAllPokemon() {
    return $.ajax({
      method: 'GET',
      url: 'api/pokemon'
    })
};