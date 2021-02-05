export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";

export const receiveTodos = todos => {
    return {
        type: RECEIVE_TODOS,
        todos
    }
}
// takes a todos Array

export const receiveTodo = todo => (
    {
    type: RECEIVE_TODO,
    todo
    }
);
// takes a todo 