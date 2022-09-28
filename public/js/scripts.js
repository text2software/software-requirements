const update = () => {
    let select = document.getElementById("people_type");
    let option = select.options[select.selectedIndex].text;
    
    option == "Pessoa Jurídica" ? 
        document.getElementById("teste").style.visibility = "hidden"
        :
        document.getElementById("teste").style.visibility = "visible"
}