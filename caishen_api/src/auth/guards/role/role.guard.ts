import { Injectable, CanActivate, ExecutionContext } from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import jwt_decode from 'jwt-decode';


@Injectable()
export class RolesGuard implements CanActivate {
  constructor(private reflector: Reflector) { }


  canActivate(context: ExecutionContext): boolean {
    const roles = this.reflector.get<string[]>('roles', context.getHandler());
    console.log(roles)
    if (!roles) {
      return true;
    }
    const matchRoles = (roles: string[], userRole: string): boolean => {
      if (roles[0] == userRole) {
        return true;
      }
      return false;
    }
    const request = context.switchToHttp().getRequest();
    console.log(request.headers);
    const decoded_token = jwt_decode(request.headers['authorization'].split(' ')[1]);
    console.log(decoded_token)

    return matchRoles(roles, (decoded_token as any).role);
  }
}
