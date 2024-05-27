document.addEventListener("DOMContentLoaded",()=>{

    //INSTANCIA PARA LAS ALERTAS
    const sAlert = new Alert();

    //INSTACIA DE LA CASE DATA
    const global = new FunGlobal();

    const $ = id => global.$(id);
    const $All = id => global.$(id);
    
    let Patern = $("#patern");
    
    /**
     * Función que verifica los campos vacíos
     */
    function checkValues(array){
        let hasValue = false;
            array.forEach(element =>{

                if(element.value != ""){
                    hasValue = true;

                }else{

                    hasValue = false;
                
                    //GENERA LA ALERTA
                    sAlert.sweetError("Campos vacíos","Debes de completa todos los campos");
                }
            });

        return hasValue;
    }

    /**
     * FUNCIÓN PARA CREAR INPUTS
     */
    function renderInputs(){
        
        //CONTENEDOR (LLAVE)
        let containerKey = document.createElement("div");
        containerKey.classList.add("col-md-6","mt-2");
        
        //CAJA DE TEXTO PARA LA CLAVE NUEVA EN EL INPUT
        let newInputKey = document.createElement("input");
        newInputKey.classList.add("form-control","perim-key"); 

        containerKey.appendChild(newInputKey);  //=> SE AGREGA EL INPUT AL CONTENEDOR

        //CONTENDEDOR (VALOR)
        let containerValue = document.createElement("div");
        containerValue.classList.add("col-md-6","mt-2");        
        
        //CAJA DE TEXTO PARA EL NUEVO VALOR EN EL INPUT
        let newInputValue = document.createElement("input");
        newInputValue.classList.add("form-control","perim-value");

        containerValue.appendChild(newInputValue);  //=> SE AGREGA EL INPUT AL CONTENEDOR

        //BOTÓN "+" Y SU CONTENEDOR
        let buttonPluss = document.createElement("Button");
        buttonPluss.classList.add("btn","btn-success","pluss","mt-2","active");
        buttonPluss.setAttribute("id","add-textBox");
        buttonPluss.setAttribute("type","button");
        buttonPluss.innerText = "+";

        let contentButton = document.createElement("div");
        contentButton.classList.add("col-md-1");

        contentButton.appendChild(buttonPluss); //=> SE AGREGA AL CONTENEDOR

        // DIV ROW{DIV(COL-MD-11) - DIV(CONTENT BUTTON)}
        let dataPerim = document.createElement("div");
        dataPerim.classList.add("row");


        //ROW (CONTIENE A LOS CONTENEDORES DE LLAVES Y VALORES)
        let row = document.createElement("div");
        row.classList.add("row");

        row.appendChild(containerKey);
        row.appendChild(containerValue);

        //CONTENEDOR PADRE
        let divPatern = document.createElement("div");
        divPatern.classList.add("col-md-11");                   
     
        divPatern.appendChild(row); //SE AGREAGA EL ROW DE CONTENEDORES AL ULTIMO DIV

        dataPerim.appendChild(divPatern);
        dataPerim.appendChild(contentButton);

        Patern.appendChild(dataPerim); //SE AGREGA AL CONTENEDOR PADRE (DEFINIDO AL INICIO)

    }

    /**
     * FUNCIÓN QUE REEMPLAZA AL BOTON "+" POR "-"
     */
    function replaceButton(event){

        if(event.target.classList.contains("pluss")){
            event.target.classList.remove("pluss");

            event.target.classList.add("btn","btn-danger","less");
            event.target.innerText = "-";
        }
    }

    /**
     * FUNCIÓN PARA ELIMINAR INPUTS
     */
    function dropInputs(event){

        let row = event.target.closest(".row"); //=> OTBTIENE EL CONTEDOR ANCESTRO MÁS PRÓXIMO

        row.remove();   //=> LO ELIMINA
    }

    $("#perim").addEventListener("click",(e)=>{

        if(e.target.classList.contains("pluss")){
            
            //ITERACIÓN POR CADA INPUT (CLAVE)
            let perimDataKey = document.querySelectorAll(".form-control.perim-key");
            let dataKey = Array.from(perimDataKey);
            let returnKey = checkValues(dataKey); 
    
            //ITERACIÓN POR CADA INPUT (CLAVE)
            let perimDataValue = document.querySelectorAll(".form-control.perim-value");
            let dataValue = Array.from(perimDataValue);
            let returnValue = checkValues(dataValue);
    
            if(returnKey && returnValue){
                renderInputs();
                replaceButton(e);
            }
        
        }else if(e.target.classList.contains("less")){

            let ask = "¿Seguro de borrar los atributos?";
            let alert = "No se podrán recuperar una vez ejecutado";

            sAlert.sweetConfirm(ask,alert,()=>{
                dropInputs(e);
            });
        }

    });

});