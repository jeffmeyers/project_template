import alt from '../alt.js'
import UserActions from '../actions/userActions.js'
import _ from 'lodash'

class UserStore {
  constructor() {
    this.currentUser = this.loadInitialCurrentUser()
    this.sessionToken = this.loadInitialSessionToken()

    console.log(this.currentUser, this.sessionToken)

    console.log(UserActions)
    this.bindListeners({
      handleUserCreated: UserActions.CREATE_USER,
      handleLoggedIn: UserActions.LOG_IN,
      handleLogOut: UserActions.LOG_OUT
    })
  }

  static isLoggedIn() {
    return !_.isEmpty(this.state.currentUser)
  }

  loadInitialCurrentUser() {
    const cachedCurrentUser = localStorage.getItem('currentUser')
    if(cachedCurrentUser) {
      return JSON.parse(cachedCurrentUser)
    } else {
      return {}
    }
  }

  loadInitialSessionToken() {
    const cachedSession = localStorage.getItem('sessionToken')
    if(cachedSession) {
      return JSON.parse(cachedSession)
    } else {
      return {}
    }
  }

  handleUserCreated(user) {
    console.log('update', user)
  }

  handleLoggedIn(session) {
    this.sessionToken = session.token
    this.currentUser = session.user

    localStorage.setItem('sessionToken', JSON.stringify(this.sessionToken))
    localStorage.setItem('currentUser', JSON.stringify(this.currentUser))
  }

  handleLogOut() {
    this.sessionToken = {}
    this.currentUser = {}
    localStorage.removeItem('sessionToken')
    localStorage.removeItem('currentUser')
  }
}

module.exports = alt.createStore(UserStore, 'UserStore')
