import { gql } from 'apollo-angular';

const GET_SONG = gql`
    query Song($id: ID!) {
        song(id: $id) {
            id
            albumId
            name
            duration
        }
    }
`

export default GET_SONG;