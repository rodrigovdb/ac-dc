export class Album {
    constructor(
        public id?: number,
        public name?: string,
        public year?: number,
        public coverImage?: string,
        public totalDuration?: string,
        public songs?: []
    ){}
}