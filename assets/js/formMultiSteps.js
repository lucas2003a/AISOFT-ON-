class multiStepsForm{

  //CONSTRUCTOR
  constructor(idForm){

    //ATRIBUTOS
    this.global = new FunGlobal();
    this.sAlert = new Alert();
    
    this.$ = id => this.global.$(id);
    this.$All = id => this.global.$All(id);
    
    this.formData = {};
    this.currentTab = 0;
    this.validForm  = false;
    
    this.form = this.global.$(`${idForm}`);
    this.tabs = this.global.$All(".tab");

    //INVOCACIONES
    this.form.querySelectorAll(".prevBtn").forEach(button =>{
      
      button.addEventListener("click", this.prevTab.bind(this));
    });
  
    this.form.querySelectorAll(".nextBtn").forEach(button =>{
  
      button.addEventListener("click", this.nexTab.bind(this));
    });
  
   this.showTab(this.currentTab);

  }

  /**
   * Mètodo para mostrar los tabs de un form multistep
   * @param {int} tabIndex 
   */
  showTab(tabIndex){
  
    this.tabs.forEach((tab, index) => {
      
      if(index == tabIndex){

        tab.classList.add("active");
      }else{
        tab.classList.remove("active");
      }
    });
  }

  /**
   * Método para mostrar el siguiente tab de un form multistep
   */
  nexTab(){
  
    if(this.currentTab < this.tabs.length -1){

      const inputs = this.tabs[this.currentTab].querySelectorAll("input, select, textarea");

      let isValid = true;

      inputs.forEach(input =>{

        if(!input.checkValidity()){
          this.validForm = false;

          this.form.classList.add('was-validated'), //MUESTRA LOS LABELS EN ROJO
          isValid = false;

          input.reportValidity();

        }else{
          this.validForm = true;

          this.formData[input.name] = input.value;
        }
      });
      
      if(isValid){
        
        this.form.classList.remove('was-validated')
        this.currentTab++;
        this.showTab(this.currentTab);
      }
    }
  }

  /**
   * Método para mostrar el tab anterior de un form multistep
   */
  prevTab(){
  
    if(this.currentTab > 0){

      this.currentTab--;
      this.showTab(this.currentTab);
    }
  }
}

