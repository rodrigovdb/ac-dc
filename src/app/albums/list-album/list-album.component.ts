import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

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
    private albumService: AlbumService,
    private router: Router
  ) { }

  ngOnInit(): void {
    this.albums = this.listAll();
  }

  onSelect(album: Album): void {
    this.router.navigate(['/albums', album.id])
  }

  listAll(): Album[] {
    return this.albumService.list()
  }
}