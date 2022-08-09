import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { Login } from 'src/app/shared';

const SESSION_KEY:string = 'albumsAppSession';

@Injectable({
  providedIn: 'root'
})
export class LoginService {
  constructor() { }

  public get currentUser(): Object {
    let user = sessionStorage[SESSION_KEY];

    return user ? JSON.parse(user) : null;
  }

  public set currentUser(user: Object) {
    sessionStorage[SESSION_KEY] = JSON.stringify(user);
  }

  login(login: Login): Observable<Login | null> {
    if(login.email == 'rodrigovdb@gmail.com' && login.password == 'rapadura'){
      login.token = 'my-token'
      return of(login)
    }
    else{
      return of(null)
    }
  }

  logout(): void {
    delete sessionStorage[SESSION_KEY];
  }
}