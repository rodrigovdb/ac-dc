import { gql } from 'apollo-angular';

const GET_ALBUMS = gql`
{
  albums {
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

export default GET_ALBUMS;