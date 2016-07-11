import React from 'react'
import ReactDOM from 'react-dom'
import { Router, Route, Link, browserHistory } from 'react-router'

import Signup from './components/signup.jsx'
import Login from './components/login.jsx'

import './stylesheets/main.scss'

class App extends React.Component {
  render() {
    return (
      <div>
        App goes here. app/main.js
      </div>
    )
  }
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Router history={browserHistory}>
    <Route path="/" component={App}>
      <Route path="/signup" component={Signup} />
      <Route path="/login" component={Login} />
    </Route>
  </Router>
  , document.getElementById('app'))
})
