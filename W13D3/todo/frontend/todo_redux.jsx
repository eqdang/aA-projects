import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import {receiveTodo, receiveTodos}  from './actions/todo_actions'
import Root from './components/root'
import {allTodos} from './reducers/selectors';

// import TodoActions from 
// import {RECEIVE_TODO} from 

// const App = () => {
//     return <h1>Todos App</h1>
// };


document.addEventListener('DOMContentLoaded', () => {
    const root = document.getElementById('content');
    const store = configureStore();
    window.store = store

    ReactDOM.render(<Root store={store}/>, root);
});

window.receiveTodo = receiveTodo;
window.receiveTodos = receiveTodos;
window.allTodos = allTodos;
