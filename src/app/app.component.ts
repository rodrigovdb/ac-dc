import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { LoginService } from './auth/services/login.service';
import { Login } from './shared';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'AC/DC Albums';

  constructor(
    private router: Router,
    private loginService: LoginService
  ){}

  currentUser(): Login | null {
    return this.loginService.currentUser;
  }

  logout(): void {
    this.loginService.logout();
    this.router.navigate(['/login']);

  }
}
