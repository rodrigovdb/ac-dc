import { gql } from 'apollo-angular';

const DELETE_SONG = gql`
    mutation SongDelete($id: ID!){
        songDelete(
            input: {
                id: $id
            }
        ) {
            id
        }
    }
`

export default DELETE_SONG;