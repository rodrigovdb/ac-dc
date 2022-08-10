import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';

import { Album } from 'src/app/shared';
import { AlbumService } from '../services/album.service';

@Component({
  selector: 'app-edit-album',
  templateUrl: '../insert-album/insert-album.component.html',
  styleUrls: ['../insert-album/insert-album.component.scss']
})
export class EditAlbumComponent implements OnInit {
  @ViewChild('formAlbum') formAlbum!: NgForm;
  album: Album = new Album();
  action: string = 'Edit';
  loading: boolean = true;

  constructor(
    private albumService: AlbumService,
    private router: Router,
    private route: ActivatedRoute
  ) { }

  ngOnInit(): void {
    const id = +this.route.snapshot.params['id'];

    this
      .albumService
      .find(id)
      .subscribe(({data, loading}) => {
        this.loading = loading;
        this.album = new Album(
          data.album.id,
          data.album.name,
          data.album.year,
          data.album.coverImage,
          data.album.totalDuration,
          data.album.songs
        );
      })
  }

  save(): void {
    if(this.formAlbum.form.valid){
      this
        .albumService
        .update(this.album)
        .subscribe(({data, loading}) => {
          this.router.navigate(['/albums'])
        })
    }
  }
}