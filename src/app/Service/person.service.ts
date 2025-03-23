import { HttpClient } from '@angular/common/http';
import { inject, Injectable } from '@angular/core';
import { appsettings } from '../Settings/appsettings';
import { Person } from '../Models/Person';

@Injectable({
  providedIn: 'root'
})
export class PersonService {
  private http=inject(HttpClient);
  private apiUrl:string=appsettings.apiUrl+"Persons";
  constructor() { }
  list(){
    return this.http.get<Person[]>(this.apiUrl);
  }
  search(PersonId:number){
    return this.http.get<Person[]>(`${this.apiUrl}/${PersonId}`);
  }
  create(Object:Person)
  {return this.http.post<Person[]>(this.apiUrl,Object);}
  update(Object:Person)
  {return this.http.put<Person[]>(this.apiUrl,Object);}
  delete(PersonId:number){
    return this.http.get<Person[]>(`${this.apiUrl}/${PersonId}`);
  }
}
