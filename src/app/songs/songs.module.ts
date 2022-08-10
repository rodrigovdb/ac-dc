import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';

import { MatCardModule } from '@angular/material/card'; 
import { MatButtonModule } from '@angular/material/button'; 
import { MatIconModule } from '@angular/material/icon'; 
import { MatInputModule } from '@angular/material/input';

import { SongService } from './services/song.service';
import { InsertSongComponent } from './insert-song/insert-song.component';
import { EditSongComponent } from './edit-song/edit-song.component';

@NgModule({
  declarations: [
    InsertSongComponent,
    EditSongComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    RouterModule,

    MatCardModule,
    MatButtonModule,
    MatIconModule,
    MatInputModule,
  ],
  providers: [
    SongService
  ]
})
export class SongsModule { }
