export class Song {
    constructor(
        public id?: number,
        public albumId?: number,
        public name?: string,
        public sort?: number,
        public duration?: string
    ){}
}