import { Component, inject } from '@angular/core';
import {MatCardModule} from '@angular/material/card';
import {MatTableModule} from '@angular/material/table';
import {MatIconModule} from '@angular/material/icon';
import {MatButtonModule} from '@angular/material/button';
import { PersonService } from '../../Service/person.service';
import { Person } from '../../Models/Person';
import { Router } from '@angular/router';
@Component({
  selector: 'app-person',
  imports: [MatCardModule,MatTableModule,MatIconModule,MatButtonModule],
  templateUrl: './person.component.html',
  styleUrl: './person.component.css'
})
export class PersonComponent {
private personService=inject(PersonService);
public listPerson:Person[]=[];
public displayedColumns:string[]=['PersonId','BranchId','DocumentId','Names','LastNames','Email','Address','DateOfBirth','Gender','Status','Action'];
GetPersons(){
  this.personService.list().subscribe({
    next:(data)=>{
      if(data.length>0){
        this.listPerson=data;

      }
    
  },
error:(err)=>
{console.log(err.message)
  
}
})

}
constructor(public router:Router){
  this.GetPersons();
}
Add(){
  this.router.navigate(['/person',0]);

}
edit(Object:Person){
  this.router.navigate(['/person',Object.personId]);
}
delete(Object:Person){
 if(confirm("Desea eliminar persona "+Object.names)){
  //this.personService.delete(Object.PersonId)
 }
}
}

