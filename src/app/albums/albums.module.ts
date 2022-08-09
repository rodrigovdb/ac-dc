import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';

import { MatListModule } from '@angular/material/list';
import { MatCardModule } from '@angular/material/card'; 
import { MatButtonModule } from '@angular/material/button'; 
import {MatInputModule} from '@angular/material/input'; 

import { AlbumService } from './services/album.service';
import { ListAlbumComponent } from './list-album/list-album.component';
import { InsertAlbumComponent } from './insert-album/insert-album.component';
import { EditAlbumComponent } from './edit-album/edit-album.component';
import { ShowAlbumComponent } from './show-album/show-album.component';

@NgModule({
  declarations: [
    ListAlbumComponent,
    InsertAlbumComponent,
    EditAlbumComponent,
    ShowAlbumComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    RouterModule,

    MatCardModule,
    MatListModule,
    MatButtonModule,
    MatInputModule,
    /*
    MatDividerModule,
    MatChipsModule
    */
  ],
  providers: [
    AlbumService
  ]
})
export class AlbumsModule { }