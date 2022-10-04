const update = () => {
    let select = document.getElementById("people_type");
    let option = select.options[select.selectedIndex].text;
    
    if (option == "Pessoa Jurídica") {
        document.getElementById('cpf_cnpj').placeholder = '00.000.000/0000-00';
        document.getElementById('label_cpf_cnpj').textContent = 'CNPJ';
    } else {
        document.getElementById('cpf_cnpj').placeholder = '000.000.000-00';
        document.getElementById('label_cpf_cnpj').textContent = 'CPF';
    }
}