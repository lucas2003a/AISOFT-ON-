class FunGlobal{

    $ = id => document.querySelector(id);
    $All = id => document.querySelectorAll(id);

    /**
     * Método para realizar aciones en base a una URL y un objeto
     * @param {string} url 
     * @param {object} params 
     * @returns 
     */
    async sendAction(url, params){

        try{
            
            let response = await fetch(url,{
                method: "POST",
                body:params
            });
            const result = await response.json(); 
            return result;

        }catch(e){
            console.error(e);
        }
        
    };
    /**
     * Método para realizar aciones en base a una URL y un objeto (devuelve un Blob)
     * @param {string} url 
     * @param {object} params 
     * @returns 
     */
    async sendActionFile(url, params){

        try{
            
            let response = await fetch(url,{
                method: "POST",
                body:params
            });
            const result = await response.blob(); 
            return result;

        }catch(e){
            console.error(e);
        }
        
    };

    /**
     * GETSON RETORNA UN JSON EN BASE A DOS CLASES DE EIQUETAS INPUT
     * @param {string} keyClass 
     * @param {string} valueClass 
     * @returns 
     */
    getJson(keyClass, valueClass){

        try{
            
            let formKeys = document.querySelectorAll(keyClass);
            let formValues = document.querySelectorAll(valueClass);
            
    
            let dataJson ={
                "clave": [],
                "valor": []
            };
    
            //INDEX SE CREA DE FORMA AUTOMATICA ES EL INDICE DE LA ITERACIÓN
            Array.from(formKeys).forEach((keyInput, index)=>{

                let key = keyInput.value.trim();
    
                let indexValue = formValues[index]; //=>ASIGANMOS EL "VALOR" CORRESPONDIENTE AL INDICE DE LA ITERACION(GUARDA LA RELACIÓN KEY => VALUE)
    
                let value = indexValue.value.trim();
    
                dataJson.clave[index] = key;
                dataJson.valor[index] = value;
            });
    
            return JSON.stringify(dataJson);
        }
        catch(e){

            console.error(e);
        }
    }

    /**
     * GETSON RETORNA UN JSON EN BASE A DOS CLASES DE ETIQUETAS DE TEXTO
     * @param {string} keyClass 
     * @param {string} valueClass 
     * @returns 
     */
    getJsonTxT(keyClass, valueClass){

        try{
            
            let formKeys = document.querySelectorAll(keyClass);
            let formValues = document.querySelectorAll(valueClass);
            
    
            let dataJson ={
                "clave": [],
                "valor": []
            };
    
            //INDEX SE CREA DE FORMA AUTOMATICA ES EL INDICE DE LA ITERACIÓN
            Array.from(formKeys).forEach((keyInput, index)=>{

                let key = keyInput.textContent.trim();
    
                let indexValue = formValues[index]; //=>ASIGANMOS EL "VALOR" CORRESPONDIENTE AL INDICE DE LA ITERACION(GUARDA LA RELACIÓN KEY => VALUE)

                
                let value = indexValue.firstChild.textContent.trim();

                dataJson.clave[index] = key;
                dataJson.valor[index] = value;

                console.log(dataJson);
            });
    
            return JSON.stringify(dataJson);
        }
        catch(e){

            console.error(e);
        }
    }

    /**
     * Método que tansforma un json a un objeto y renderiza sus valores
     * @param {object} JSONobj 
     */
    JSONtoObject(JSONobj){

        const json = JSON.parse(JSONobj);

        let arrayKey = json.clave;
        let arrayValue = json.valor;
    
        arrayKey.forEach((key, index)=>{
    
          let value = arrayValue[index];
    
          if(key != "" || value != ""){
    
              renderInputs(key, value);
          }
        });

        return json;
    }

}
