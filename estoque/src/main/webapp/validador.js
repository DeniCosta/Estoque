function cadastrar() {
	let codigo = form.codigo.value
	let nome = form.nome.value
	let valor = form.valor.value
	let quantidade = form.quantidade.value
	if (codigo === "") {
		alert('Preencha o codigo')
		document.getElementsByName("codigo")[0].focus();

		return false
	} else if (nome === "") {
		alert('Preencha o campo nome')
		document.getElementsByName("nome")[0].focus();

		return false
	} else if (valor === "") {
		alert('Preencha o valor')
		document.getElementsByName("valor")[0].focus();

		return false
	} else if (quantidade === "") {
		alert('Preencha a quantidade')
		document.getElementsByName("quantidade")[0].focus();

		return false
	} else {
		document.forms["form"].submit()
	}
}