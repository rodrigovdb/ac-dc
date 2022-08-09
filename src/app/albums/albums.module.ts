import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';

import { MatListModule } from '@angular/material/list';
import { MatCardModule } from '@angular/material/card'; 
/*
import { MatButtonModule } from '@angular/material/button'; 
import { MatDividerModule } from '@angular/material/divider';
import {MatChipsModule} from '@angular/material/chips'; 
*/

import { AlbumService } from './services/album.service';
import { ListAlbumComponent } from './list-album/list-album.component';

@NgModule({
  declarations: [
    ListAlbumComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    RouterModule,

    MatCardModule,
    MatListModule,
    /*
    MatButtonModule,
    MatDividerModule,
    MatChipsModule
    */
  ],
  providers: [
    AlbumService
  ]
})
export class AlbumsModule { }