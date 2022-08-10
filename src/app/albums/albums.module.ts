import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';

import { MatCardModule } from '@angular/material/card'; 
import { MatButtonModule } from '@angular/material/button'; 
import { MatDividerModule } from '@angular/material/divider'; 
import { MatIconModule } from '@angular/material/icon'; 
import { MatInputModule } from '@angular/material/input';
import { MatListModule } from '@angular/material/list';

import { AlbumService } from './services/album.service';
import { ListAlbumComponent } from './list-album/list-album.component';
import { InsertAlbumComponent } from './insert-album/insert-album.component';
import { EditAlbumComponent } from './edit-album/edit-album.component';
import { ShowAlbumComponent } from './show-album/show-album.component';

import { SongsModule } from '../songs/songs.module';

@NgModule({
  declarations: [
    ListAlbumComponent,
    InsertAlbumComponent,
    EditAlbumComponent,
    ShowAlbumComponent,
  ],
  imports: [
    CommonModule,
    FormsModule,
    RouterModule,
    
    MatButtonModule,
    MatCardModule,
    MatDividerModule,
    MatIconModule,
    MatInputModule,
    MatListModule,

    SongsModule
  ],
  providers: [
    AlbumService
  ]
})
export class AlbumsModule { }