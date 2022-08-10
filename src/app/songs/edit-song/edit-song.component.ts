import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';

import { Song } from 'src/app/shared';
import { SongService } from '../services/song.service';

@Component({
  selector: 'app-edit-song',
  templateUrl: '../insert-song/insert-song.component.html',
  styleUrls: ['../insert-song/insert-song.component.scss']
})
export class EditSongComponent implements OnInit {
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
    const id = this.route.snapshot.params['id'];
    this.songService.find(id).subscribe(({data, loading}) => {
      this.loading = loading
      this.song = new Song(
        data.song.id,
        data.song.albumId,
        data.song.name,
        data.song.sort,
        data.song.duration
      )
    })
  }

  save(): void {
    if(this.formSong.form.valid){
      this
        .songService
        .update(this.song)
        .subscribe(({data, loading}) => {
          this.router.navigate(['/albums', this.song.albumId])
        })
    }
  }
}