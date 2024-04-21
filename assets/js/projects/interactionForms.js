document.addEventListener("DOMContentLoaded",()=>{
    
    //INSTANCIA PARA LAS ALERTAS
    const sAlert = new Alert();

    //INSTACIA DE LA CASE DATA
    const global = new FunGlobal();

    const $ = id => global.$(id);
    const $All = id => global.$(id);

    let viewImage = $("#file-view");

    /**
     * FUNCION PARA LEER LA IMAGEN
     */
    function readFile(event){

        const file = event.target.files[0];
        const reader = new FileReader();

        reader.onload = (event)=>{

            //ESTABLECE LA RUTA DE LA IMAGEN (RUTA TEMPORAL)
            viewImage.setAttribute("src",`${event.target.result}`);
            viewImage.style.width = "100%";
            viewImage.style.height = "20rem";

        };

        reader.readAsDataURL(file);
    }

    $("#in-image").addEventListener("change",(e)=>{

        console.log(e);
        if(e.target.files.length > 0){
            
            console.log(e);
            readFile(e);
        }
    });
});