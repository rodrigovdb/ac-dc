import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';

import { LoginService } from '../services/login.service';
import { Login } from 'src/app/shared';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {
  @ViewChild('formLogin') formLogin!: NgForm;

  login: Login = new Login();
  loading: boolean = false;
  message!: string;

  constructor(
    private loginService: LoginService,
    private router: Router,
    private route: ActivatedRoute
  ) {
    if(this.loginService.currentUser){
      this.router.navigate(['/albums'])
    }
  }

  ngOnInit(): void {
    this.route.queryParams.subscribe(params => {
      this.message = params['error'];
    })
  }

  authenticate(): void {
    if(this.formLogin.valid){
      this.loginService.login(this.login).subscribe({
        next: (user) => {
          this.login.token = user.token;
          this.loginService.currentUser = this.login;

          this.loading = false;
          this.router.navigate(['/albums'])
        },
        error: (value) => {
          console.log(value)
          this.loading = false;
          this.message = 'Invalid email / password'
        }
      })
    }
  }
}