import { NgModule } from '@angular/core';
import { ApolloModule, APOLLO_OPTIONS } from 'apollo-angular';
import { ApolloClientOptions, ApolloLink, InMemoryCache } from '@apollo/client/core';
import { setContext } from '@apollo/client/link/context';
import { HttpLink } from 'apollo-angular/http';

import { LoginService } from './auth/services/login.service';
import { Login } from './shared';

//const uri = 'https://ac-dc.herokuapp.com/graphql'; // <-- add the URL of the GraphQL server here
const uri = 'http://localhost:3000/graphql'; // <-- add the URL of the GraphQL server here

export function createApollo(httpLink: HttpLink): ApolloClientOptions<any> {
  const basic = setContext((operation, context) => ({
    headers: {
      'Accept': 'charset=utf-8',
      'Content-Type': 'application/json'
    }
  }));
  
  const auth = setContext((operation, context) => {
    const service: LoginService = new LoginService()
    const currentUser: Login = service.currentUser

    if(currentUser == null){
      return {}
    }
    else{
      return {
        headers: {
          'Authorization': `Bearer ${currentUser.token}`
        }
      }
    }
  })

  const link = ApolloLink.from([basic, auth, httpLink.create({ uri })])

  return {
    link: link,
    cache: new InMemoryCache(),
  };
}

@NgModule({
  exports: [ApolloModule],
  providers: [
    {
      provide: APOLLO_OPTIONS,
      useFactory: createApollo,
      deps: [HttpLink],
    },
  ],
})
export class GraphQLModule {}
