import { Component, OnInit } from '@angular/core';
import { Apollo } from 'apollo-angular';
import { Router } from '@angular/router';

import { AlbumService } from '../services/album.service';
import { LoginService } from 'src/app/auth/services/login.service';
import { Album, Login } from 'src/app/shared';
import GET_ALBUMS from 'src/app/graphql/getAlbums';

@Component({
  selector: 'app-list-album',
  templateUrl: './list-album.component.html',
  styleUrls: ['./list-album.component.scss']
})
export class ListAlbumComponent implements OnInit {
  albums: Album[] = []
  loading: boolean = true;

  constructor(
    private albumService: AlbumService,
    private loginService: LoginService,
    private apollo: Apollo,
    private router: Router
  ) { }

  ngOnInit(): void {
    this.apollo.watchQuery<any>({ query: GET_ALBUMS })
      .valueChanges
      .subscribe(({ data, loading }) => {
        this.loading = loading;
        this.albums = data.albums;
        //console.log(data.albums[0].songs.length)
      });
  }

  currentUser(): Login {
    return this.loginService.currentUser;
  }

  onSelect(album: Album): void {
    this.router.navigate(['/albums', album.id])
  }
}