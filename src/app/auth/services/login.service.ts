import { Injectable } from '@angular/core';

import { Observable, of, throwError } from 'rxjs';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { JwtHelperService } from "@auth0/angular-jwt";

import { environment } from 'src/environments/environment';
import { Login } from 'src/app/shared';

const SESSION_KEY:string = 'albumsAppSession';
const BASE_URL:string = `${environment.apiUrl}/authenticate`;

@Injectable({
  providedIn: 'root'
})
export class LoginService {
  constructor(
    private httpClient: HttpClient
  ) {}

  static getCurrentUser(): Login {
    let user = sessionStorage[SESSION_KEY];

    return user ? JSON.parse(user) : null;
  }

  public get currentUser(): Login {
    let user = sessionStorage[SESSION_KEY];

    return user ? JSON.parse(user) : null;
  }

  public set currentUser(login: Login) {
    const helper = new JwtHelperService();
    const decodedToken = helper.decodeToken(login.token)
    login.token = decodedToken.token

    sessionStorage[SESSION_KEY] = JSON.stringify(login);
  }

  login(login: Login): Observable<any | never> {
    const params = { email: login.email, password: login.password }
    const httpOptions = { headers: new HttpHeaders({ 'Content-Type': 'application/json' }) }
    return this
      .httpClient
      .post<any>(BASE_URL, params, httpOptions)
  }

  logout(): void {
    delete sessionStorage[SESSION_KEY];
  }
}