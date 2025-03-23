import { Component } from '@angular/core';
import { MatToolbarModule }from "@angular/material/toolbar"
import { MatButton }from "@angular/material/button"
@Component({
  selector: 'app-inicio',
  imports: [MatToolbarModule,MatButton],
  templateUrl: './inicio.component.html',
  styleUrl: './inicio.component.css'
})
export class InicioComponent {

}
