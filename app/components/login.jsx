import React from 'react'
import UserActions from '../actions/userActions.js'
import UserStore from '../stores/userStore.js'

import { browserHistory } from 'react-router'

export default class Login extends React.Component {
  constructor() {
    super()

    this.onUserStoreChange = this.onUserStoreChange.bind(this)
  }

  componentDidMount() {
    UserStore.listen(this.onUserStoreChange)
  }

  componentWillUnmount() {
    UserStore.unlisten(this.onUserStoreChange)
  }

  onUserStoreChange() {
    if (UserStore.isLoggedIn()) {
      browserHistory.push('/build')
    }
  }

  onSubmit(evt) {
    evt.preventDefault()
    UserActions.logIn(
      this.valueFor('email'),
      this.valueFor('password')
    )
  }

  valueFor(fieldName) {
    return this.refs[fieldName].value.trim()
  }

  render() {
    return (
      <form onSubmit={this.onSubmit.bind(this)}>
        <label>
          Email:
          <input type="email" name="email" ref="email" />
        </label>
        <label>
          Password:
          <input type="password" name="password" ref="password" />
        </label>

        <button type="submit">Log In</button>
      </form>
    )
  }
}
