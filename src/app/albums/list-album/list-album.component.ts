import { Component, OnInit } from '@angular/core';

import { AlbumService } from '../services/album.service';
import { Album } from 'src/app/shared';

@Component({
  selector: 'app-list-album',
  templateUrl: './list-album.component.html',
  styleUrls: ['./list-album.component.scss']
})
export class ListAlbumComponent implements OnInit {
  albums: Album[] = []

  constructor(
    private albumService: AlbumService
  ) { }

  ngOnInit(): void {
    this.albums = this.listAll();
  }

  listAll(): Album[] {
    return this.albumService.list()
  }
}