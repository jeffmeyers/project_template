import React from 'react'
import UserActions from '../actions/userActions.js'
import UserStore from '../stores/userStore.js'

export default class Signup extends React.Component {
  onSubmit(evt) {
    evt.preventDefault()
    UserActions.createUser(this.buildUser())
  }

  buildUser() {
    return {
      email: this.valueFor('email'),
      first_name: this.valueFor('first_name'),
      last_name: this.valueFor('last_name'),
      password: this.valueFor('password'),
      password_confirmation: this.valueFor('password_confirmation')
    }
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
          First name:
          <input type="text" name="first_name" ref="first_name" />
        </label>
        <label>
          Last name:
          <input type="text" name="last_name" ref="last_name" />
        </label>
        <label>
          Password:
          <input type="password" name="password" ref="password" />
        </label>
        <label>
          Confirm:
          <input type="password" name="password_confirmation" ref="password_confirmation" />
        </label>

        <button type="submit">Sign Up</button>
      </form>
    )
  }
}
