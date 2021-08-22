const signInButton=document.getElementById('signIn');
const signUpButton=document.getElementById('signUp');
const container=document.getElementById('container');

signInButton.addEventListener('click',()=>container.classList.add('left-panel-active'));

signUpButton.addEventListener('click',()=>container.classList.remove('left-panel-active'));