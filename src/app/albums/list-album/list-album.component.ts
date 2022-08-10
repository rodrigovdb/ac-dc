import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

import { LoginService } from 'src/app/auth/services/login.service';
import { Album, Login } from 'src/app/shared';
import GET_ALBUMS from 'src/app/graphql/getAlbums';
import { AlbumService } from '../services/album.service';

@Component({
  selector: 'app-list-album',
  templateUrl: './list-album.component.html',
  styleUrls: ['./list-album.component.scss']
})
export class ListAlbumComponent implements OnInit {
  albums: Album[] = []
  loading: boolean = true;

  constructor(
    private loginService: LoginService,
    private albumService: AlbumService,
    private router: Router
  ) { }

  ngOnInit(): void {
    this
      .albumService
      .list()
      .subscribe(({data, loading}) => {
        this.loading = loading;
        this.albums = data.albums;
      })
  }

  currentUser(): Login {
    return this.loginService.currentUser;
  }

  onSelect(album: Album): void {
    this.router.navigate(['/albums', album.id])
  }
}