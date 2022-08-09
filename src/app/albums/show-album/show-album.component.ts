import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';

import { Album } from 'src/app/shared';
import { AlbumService } from '../services/album.service';

@Component({
  selector: 'app-show-album',
  templateUrl: './show-album.component.html',
  styleUrls: ['./show-album.component.scss']
})
export class ShowAlbumComponent implements OnInit {
    album: Album = new Album();

  constructor(
    private albumService: AlbumService,
    private router: Router,
    private route: ActivatedRoute
  ) { }

  ngOnInit(): void {
    this.album = this.fetchAlbum();
  }

  destroy(id: any): void {
    if(confirm("Are you sure?")) {
      const album = this.fetchAlbum();

      this.albumService.delete(id);
      this.router.navigate(['/albums'])
    }
  }

  private fetchAlbum(): Album {
    const id = +this.route.snapshot.params['id'];
    const album = this.albumService.find(id);
    if(album == undefined){
      throw new Error(`Album ${id} does not exist`)
    }

    return album;
  }
}