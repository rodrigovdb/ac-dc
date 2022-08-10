import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';

import { LoginService } from 'src/app/auth/services/login.service';
import { Album, Login, Song } from 'src/app/shared';
import { SongService } from '../services/song.service';

@Component({
  selector: 'app-list-songs',
  templateUrl: './list-songs.component.html',
  styleUrls: ['./list-songs.component.scss']
})
export class ListSongsComponent implements OnInit {
  @Input() album : Album = new Album();

  constructor(
    private router: Router,
    private loginService: LoginService,
    private songService: SongService
  ) { }

  ngOnInit(): void {
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
          this.router.navigate(['/albums', this.album.id])
        })
    }
  }
}
