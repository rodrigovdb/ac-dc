import { gql } from 'apollo-angular';

const CREATE_ALBUM = gql`
    mutation AlbumCreate($name: String!, $year: Int!, $coverImage: String!){
        albumCreate(
        input: {
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

export default CREATE_ALBUM;