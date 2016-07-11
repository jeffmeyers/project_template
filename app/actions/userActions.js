import alt from '../alt.js'
import API from '../api.js'

class UserActions {
  createUser(user) {
    return (dispatch) => {
      API.post('/users', user)
        .end((err, res) => {
          dispatch(res.body.user)
        })
    }
  }

  logIn(email, password) {
    return (dispatch) => {
      API.post('/sessions', { email, password })
        .end((err, res) => {
          dispatch(res.body.sessions)
        })
    }
  }

  logOut() {
    return null
  }
}

module.exports = alt.createActions(UserActions)
