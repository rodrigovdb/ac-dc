import { gql } from 'apollo-angular';

const DELETE_ALBUM = gql`
    mutation AlbumDelete($id: ID!){
        albumDelete(
        input: {
            id: $id
        }
        ) {
            id
        }
    }
`

export default DELETE_ALBUM;