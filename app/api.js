import request from 'superagent'

export default class API {
  static getToken() {
    return API.getSessionToken().token;
  }

  static getSessionToken() {
    const cachedSession = localStorage.getItem('sessionToken')
    if(cachedSession) {
      return JSON.parse(cachedSession)
    } else {
      return {}
    }
  }

  static post(url, data) {
    return request
      .post(url)
      .set('Authentication', `Token ${API.getToken()}`)
      .send(data)
  }

  static get(url) {
    return request
      .get(url)
      .set('Authentication', `Token ${API.getToken()}`)
  }
}
