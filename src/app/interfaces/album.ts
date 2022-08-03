import { Song } from "./song";

export interface Album {
    id: number;
    name: string;
    year: number;
    coverImage: string;
    totalDuration: string;
    songs: Song[];
}