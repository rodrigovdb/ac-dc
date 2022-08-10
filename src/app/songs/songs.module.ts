import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';

import { MatCardModule } from '@angular/material/card'; 
import { MatButtonModule } from '@angular/material/button'; 
import { MatInputModule } from '@angular/material/input';

import { SongService } from './services/song.service';
import { InsertSongComponent } from './insert-song/insert-song.component';

@NgModule({
  declarations: [
    InsertSongComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    RouterModule,

    MatCardModule,
    MatButtonModule,
    MatInputModule,
  ],
  providers: [
    SongService
  ]
})
export class SongsModule { }
