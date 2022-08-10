import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';

import { AlbumService } from 'src/app/albums/services/album.service';
import { LoginService } from 'src/app/auth/services/login.service';
import { Album, Login, Song } from 'src/app/shared';
import { SongService } from '../services/song.service';

@Component({
  selector: 'app-list-songs',
  templateUrl: './list-songs.component.html',
  styleUrls: ['./list-songs.component.scss']
})
export class ListSongsComponent implements OnInit {
  songs: Song[] = []
  album!: Album;
  loading: boolean = true;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private albumService: AlbumService,
    private loginService: LoginService,
    private songService: SongService
  ) { }

  ngOnInit(): void {
    const albumId = this.route.snapshot.params['albumId'];

    this
      .albumService
      .find(albumId)
      .subscribe(({data, loading}) => {
        this.loading = loading;
        this.album = data.album;
        this.songs = data.album.songs;
      })
  }

  currentUser(): Login | null {
    return this.loginService.currentUser;
  }

  destroy(id: any): void {
    if(this.currentUser() && confirm("Are you sure?")) {
      this
        .songService
        .delete(id)
        .subscribe(({ data, loading }) => {
          this.loading = loading;
          this.router.navigate(['/albums', this.album.id])
        })
    }
  }
}
