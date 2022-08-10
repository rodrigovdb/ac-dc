import { NgModule } from '@angular/core';
import { ApolloModule, APOLLO_OPTIONS } from 'apollo-angular';
import { ApolloClientOptions, ApolloLink, InMemoryCache } from '@apollo/client/core';
import { setContext } from '@apollo/client/link/context';
import { HttpLink } from 'apollo-angular/http';

import { environment } from './../environments/environment';
import { LoginService } from './auth/services/login.service';
import { Login } from './shared';
import { HttpClient, HttpHandler } from '@angular/common/http';

const uri = `${environment.apiUrl}/graphql`

function link(httpLink: HttpLink): any{
  const currentUser: Login = LoginService.getCurrentUser()

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
