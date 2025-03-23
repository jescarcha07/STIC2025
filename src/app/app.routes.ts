import { Routes } from '@angular/router';
import { InicioComponent } from './Pages/inicio/inicio.component';
import { PersonComponent } from './Pages/person/person.component';
import { LoginComponent } from './Pages/login/login.component';
export const routes: Routes = [
    {path:'',component:InicioComponent},
    {path:'person/:id',component:PersonComponent},
    {path:'login', component: LoginComponent}
];
