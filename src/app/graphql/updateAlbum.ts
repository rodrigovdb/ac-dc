import { gql } from 'apollo-angular';

const UPDATE_ALBUM = gql`
    mutation AlbumUpdate($id: ID!, $name: String!, $year: Int!, $coverImage: String!){
        albumUpdate(
            input: {
                id: $id,
                name: $name,
                year: $year,
                coverImage: $coverImage
            }
        ) {
            id
            name
            year
            coverImage
        }
    }

`

export default UPDATE_ALBUM;