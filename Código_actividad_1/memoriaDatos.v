//Memoria de programa, se inicializa y no se modifica
 
 module memoriaDatos(input  wire clk, guardar, activa,
                     input  wire [6:0] direccionMemoria,
                     input  wire [7:0] entradaDatos,
                     output wire [7:0] salidaDatos);
  
   reg [7:0] mem[0:127]; //memoria de 127 palabras de 8 bits de ancho
 
   initial
   begin
     $readmemb("programdatafile.dat",mem); // inicializa la memoria del fichero en texto binario
   end
   
   assign salidaDatos = mem[direccionMemoria];

   always @(posedge guardar) 
     if(guardar && activa)
     begin
       mem[direccionMemoria] = entradaDatos;
     end

 endmodule
  
   
