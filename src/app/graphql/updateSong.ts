import { gql } from 'apollo-angular';

const UPDATE_SONG = gql`
mutation SongUpdate($id: ID!, $albumId: String!, $name: String!, $duration: String!){
    songUpdate(
        input: {
            id: $id,
            albumId: $albumId,
            name: $name,
            duration: $duration
        }
    ) {
        id
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

export default UPDATE_SONG;