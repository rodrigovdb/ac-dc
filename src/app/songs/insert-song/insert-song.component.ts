import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';

import { Song } from 'src/app/shared';
import { SongService } from '../services/song.service';

@Component({
  selector: 'app-insert-song',
  templateUrl: './insert-song.component.html',
  styleUrls: ['./insert-song.component.scss']
})
export class InsertSongComponent implements OnInit {
  @ViewChild('formSong') formSong!: NgForm;

  song: Song = new Song()
  action: string = 'Create'
  loading: boolean = false

  constructor(
    private songService: SongService,
    private router: Router,
    private route: ActivatedRoute
  ) { }

  ngOnInit(): void {
    const albumId = this.route.snapshot.params['albumId'];
    this.song.albumId = albumId;
  }

  save(): void {
    if(this.formSong.form.valid){
      this
        .songService
        .insert(this.song)
        .subscribe(({data, loading}) => {
          this.router.navigate(['/albums', this.song.albumId])
        })
    }
  }
}