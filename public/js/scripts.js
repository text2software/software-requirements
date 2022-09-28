const update = () => {
    let select = document.getElementById("people_type");
    let option = select.options[select.selectedIndex].text;
    
    if (option == "Pessoa Jurídica") {
        document.getElementById("physical_person").style.visibility = "hidden"
        document.getElementById("legal_person").style.visibility = "visible"
    } else {
        document.getElementById("physical_person").style.visibility = "visible"
        document.getElementById("legal_person").style.visibility = "hidden"
    }
}