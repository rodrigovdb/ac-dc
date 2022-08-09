import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AlbumService } from './services/album.service';

@NgModule({
  declarations: [],
  imports: [
    CommonModule
  ],
  providers: [
    AlbumService
  ]
})
export class AlbumsModule { }