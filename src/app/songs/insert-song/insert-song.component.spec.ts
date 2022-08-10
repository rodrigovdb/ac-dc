import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InsertSongComponent } from './insert-song.component';

describe('InsertSongComponent', () => {
  let component: InsertSongComponent;
  let fixture: ComponentFixture<InsertSongComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ InsertSongComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(InsertSongComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
