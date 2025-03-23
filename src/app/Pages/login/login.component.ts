import { Component, inject, Input, OnInit } from '@angular/core';
import { UserService } from '../../Service/user.service';
import { FormGroup } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  standalone:true,
  imports: [],
  templateUrl: './login.component.html',
  styleUrl: './login.component.css'
})
export class LoginComponent implements OnInit {
  //@Input('username')username:string = '';
  //@Input('password')password: string = '';
  private userService=inject(UserService)
  constructor(private router:Router){}
  ngOnInit():void{
    
  }
  
  onSubmit() {
    var user=(<HTMLInputElement>document.getElementById('username')).value;
    var pass=(<HTMLInputElement>document.getElementById('password')).value;
    // Implement your login logic here
    console.log('Username:', user);
    console.log('Password:', pass);
    this.userService.login(user,pass).subscribe({
      next:(data)=>{
      alert(data);
      console.log(data);
    },
  error:(err)=>
  {
    console.log(err.error)
    alert(err.error)
    
  }
  })
  
  }
}