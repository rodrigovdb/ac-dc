import { NgModule } from '@angular/core';
import { ApolloModule, APOLLO_OPTIONS } from 'apollo-angular';
import { ApolloClientOptions, ApolloLink, InMemoryCache } from '@apollo/client/core';
import { setContext } from '@apollo/client/link/context';
import { HttpLink } from 'apollo-angular/http';

import { LoginService } from './auth/services/login.service';
import { Login } from './shared';

const uri = 'https://ac-dc.herokuapp.com/graphql'; // <-- add the URL of the GraphQL server here

function link(httpLink: HttpLink): any{
  const service: LoginService = new LoginService()
  const currentUser: Login = service.currentUser

  if(currentUser == null) {
    return httpLink.create({ uri })
  }

  const basic = setContext((operation, context) => ({
    headers: {
      'Accept': 'charset=utf-8',
      'Content-Type': 'application/json'
    }
  }));

  const auth = setContext((operation, context) => ({
    headers: {
      'Authorization': `Bearer ${currentUser.token}`
    }
  }));
  
  return ApolloLink.from([basic, auth, httpLink.create({ uri })])
}

export function createApollo(httpLink: HttpLink): ApolloClientOptions<any> {
  return {
    link: link(httpLink),
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
