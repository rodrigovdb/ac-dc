import { Component, OnInit } from '@angular/core';
import { Album } from '../interfaces/album';
import { ALBUMS } from '../mock-albums';

@Component({
  selector: 'app-albums',
  templateUrl: './albums.component.html',
  styleUrls: ['./albums.component.sass']
})
export class AlbumsComponent implements OnInit {

  albums = ALBUMS;

  selectedAlbum?: Album;

  constructor() { }

  ngOnInit(): void {
  }

  onSelect(album: Album): void {
    this.selectedAlbum = album;
  }
}