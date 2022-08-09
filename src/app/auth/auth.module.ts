import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';

import { MatCardModule } from '@angular/material/card'; 
import { MatButtonModule } from '@angular/material/button'; 
import {MatInputModule} from '@angular/material/input'; 

import { LoginComponent } from './login/login.component';
import { LoginService } from './services/login.service';

@NgModule({
  declarations: [
    LoginComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    RouterModule,

    MatCardModule,
    MatButtonModule,
    MatInputModule
  ],
  providers: [
    LoginService
  ],
})
export class AuthModule { }