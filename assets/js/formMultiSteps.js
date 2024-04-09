document.addEventListener("DOMContentLoaded",()=>{
  
  const global = new FunGlobal();
  const sAlert = new Alert();
  
  const $ = id => global.$(id);
  const $All = id => global.$All(id);
  
  let formData = {};
  let currentTab = 0;
  
  const form = $("#form-multisetps");
  const tabs = $All(".tab");
  
    function showTab(tabIndex){
  
      tabs.forEach((tab, index) => {
        
        if(index == tabIndex){
  
          tab.classList.add("active");
        }else{
          tab.classList.remove("active");
        }
      });
    }
  
    function nexTab(){
  
      if(currentTab < tabs.length -1){
  
        const inputs = tabs[currentTab].querySelectorAll("input, select, textarea");
  
        let isValid = true;
  
        inputs.forEach(input =>{
  
          if(!input.checkValidity()){
            form.classList.add('was-validated'), //MUESTRA LOS LABELS EN ROJO
            isValid = false;
  
            input.reportValidity();
            console.log("no valido")
  
          }else{
            formData[input.name] = input.value;
            console.log(formData);
          }
        });
        
        if(isValid){
          
          form.classList.remove('was-validated')
          currentTab++;
          showTab(currentTab);
        }
      }
    }
  
    function prevTab(){
  
      if(currentTab > 0){
  
        currentTab--;
        showTab(currentTab);
      }
    }
  
    function submitForm(){
  
      const inputs = tabs[currentTab].querySelectorAll("input, select, textarea");
      let isValid = true;
  
      inputs.forEach(input => {
  
        if(!input.checkValidity()){
          form.classList.add('was-validated'), //MUESTRA LOS LABELS EN ROJO
          isValid = false;
          input.reportValidity();
  
        }else{
  
          formData[input.name] = input.value;
        }
  
        if(isValid){
  
          console.log("datos del fomulario: ", formData)
        }
      });
    }
  
    form.querySelectorAll(".submit").forEach(button =>{
  
      button.addEventListener("click", submitForm);
    });
  
    form.querySelectorAll(".prevBtn").forEach(button =>{
      
      button.addEventListener("click", prevTab);
    });
  
    form.querySelectorAll(".nextBtn").forEach(button =>{
  
      button.addEventListener("click", nexTab);
    });
  
   showTab(currentTab);
});
