document.addEventListener("DOMContentLoaded",()=>{
    
    //INSTANCIA PARA LAS ALERTAS
    const sAlert = new Alert();

    //INSTACIA DE LA CASE DATA
    const global = new FunGlobal();

    const $ = id => global.$(id);
    const $All = id => global.$(id);
    /**
     * FUNCÓN PARA RENDERIZAR LOS DEPARTAMENTOS
     */
    async function renderDepartaments(){

        try{

            let url = `../../Controllers/ubigeo/departament.controller.php`;

            let params = new FormData();
            params.append("action","list");

            let results = await global.sendAction(url, params);

            if(results){
                
                results.forEach(departament=>{
                        
                    let newOption = document.createElement("option");
                    newOption.value = departament.iddepartamento; 
                    newOption.innerText = departament.departamento;
                    
                    $("#iddepartamento").appendChild(newOption);
                });
            }
        }
        catch(e){

            console.error(e);
        }
    }
    
    /**
     * FUNCÓN PARA RENDERIZAR LAS PROVINCIAS
     */
    async function renderProvinces(){

        try{

            let url = `../../Controllers/ubigeo/province.controller.php`;

            let params = new FormData();
            params.append("action","list");
            params.append("iddepartamento",$("#iddepartamento").value);

            let results = await global.sendAction(url, params);

            if(results){

                results.forEach(province =>{
                    let newOption = document.createElement("option");
                    newOption.value = province.idprovincia; 
                    newOption.innerText = province.provincia;
                    
                    $("#idprovincia").appendChild(newOption);
                });

            }
        }
        catch(e){
            console.error(e);
        }
    };

     /**
     * FUNCIÓN PARA RENDERIZAR LOS DISTRITOS
     */
    async  function renderDistricts(){

        try{

            let url = `../../Controllers/ubigeo/district.controller.php`;

            let params = new FormData();
        
            params.append("action","list");
            params.append("idprovincia",$("#idprovincia").value);

            let results = await global.sendAction(url, params);

            if(results){

                results.forEach(district =>{
                    let newOption = document.createElement("option");
                    newOption.value = district.iddistrito; 
                    newOption.innerText = district.distrito;
                    
                    $("#iddistrito").appendChild(newOption);
                });

            }
        }
        catch(e){
            console.error(e);
        }
    };

    /**
     * FUNCIÓN PARA RENDERIZAR LAS SEDES
     */
    async function renderSedes(){

        try{

            let url = `../../Controllers/address.controller.php`;
            let params = new FormData();

            params.append("action","list");
            params.append("iddistrito",$("#iddistrito").value);

            let results = await global.sendAction(url, params);

            if(results){
                
                results.forEach(address=>{
                    let newOption = document.createElement("option");
                    newOption.value = address.iddireccion;
                    newOption.innerText = address.direccion;
        
                    $("#iddireccion").appendChild(newOption);
                });
            }
        }
        catch(e){
            console.error(e);
        }
    };

    /**
     * FUNCIÓN PARA RESETEAR LOS INPUTS
     */
    function resetSelect(id,text, callback){
        
        $(id).innerHTML = "";

        const defaultOption = document.createElement("option");
        defaultOption.value = ""; 
        defaultOption.innerText = text;
        
        $(id).appendChild(defaultOption);

        callback();
    }

    $("#iddistrito").addEventListener("change",()=>{

        resetSelect("#iddireccion","Sedes",renderSedes);
    });

    $("#idprovincia").addEventListener("change",()=>{
        
        resetSelect("#iddistrito","Distritos",renderDistricts);
    });

    $("#iddepartamento").addEventListener("change",()=>{
        
        resetSelect("#idprovincia","Provincias",renderProvinces);
    });

    renderDepartaments();
})