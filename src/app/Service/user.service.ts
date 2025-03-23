import { HttpClient } from '@angular/common/http';
import { inject, Injectable } from '@angular/core';
import { appsettings } from '../Settings/appsettings';

@Injectable({
  providedIn: 'root'
})
export class UserService {
 private http=inject(HttpClient);
  private apiUrl:string=appsettings.apiUrl+"Users";
  constructor() { }
  login(username:string,password:string)
    {return this.http.post(this.apiUrl+"\\Login?username="+username+"&password="+password,null);}
}
