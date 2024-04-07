    
let numerCards = 3;         //VARIBLEQUE ALMACENA LOS CARDS

async function renderInitalCards(){

      for(let i = 0 ; i < 4 && i < dataProject.length; i++){

        await renderCard(dataProject[i]);
        numerCards++;
      }
    }
    
    async function renderAdditionalCards(){
      
      try{

        const project = dataProject[numerCards];
        if(project){

          await renderCard(project);
          numerCards++;
        }

      }catch(e){

        console.error(e);

      }
    }
     
 
    async function startUI(){

      await listProyects();
    }

    startUI();    
    
