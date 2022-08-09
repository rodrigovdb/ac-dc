import { gql } from 'apollo-angular';

const GET_ALBUM = gql`
    query Album($id: ID!) {
        album(id: $id) {
            id
            name
            year
            coverImage
            totalDuration
            songs {
                id
                name
                sort
                duration
            }
        }
    }
`

export default GET_ALBUM;