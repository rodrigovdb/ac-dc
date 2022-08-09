import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree } from '@angular/router';
import { Observable } from 'rxjs';

import { LoginService } from './services/login.service';

@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {

  constructor(
    private loginService: LoginService,
    private router: Router
  ) {}

  /**
   * Just check if the user is authenticated.
   * On routes each route is protected with this guard.
   * @see app-routing.module.ts
   * TODO: Make sure if the user has privileges to access each route.
   */
  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): Observable<boolean | UrlTree> | Promise<boolean | UrlTree> | boolean | UrlTree {
      const currentUser = this.loginService.currentUser;

      if(currentUser != null){
        return true;
      }
      
      this.router.navigate(['/albums'])
      return false;
  }
}