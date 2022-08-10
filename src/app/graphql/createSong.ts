import { gql } from 'apollo-angular';

const CREATE_SONG = gql`
    mutation SongCreate($albumId: String!, $name: String!, $duration: String!){
        songCreate(
        input: {
            albumId: $albumId,
            name: $name,
            duration: $duration
        }
        ) {
            id
            albumId
            name
            sort
            duration
            album {
                id
                name
            }
        }
    }
`

export default CREATE_SONG;