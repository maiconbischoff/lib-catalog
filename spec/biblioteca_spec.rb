require_relative '../models/biblioteca'

RSpec.describe Biblioteca do
  let(:livro) do
    Livro.new(
      usuario: 'João',
      nome: 'POO em Ruby',
      isbn: '111',
      status: 'Em estante',
      autor: 'Monteiro Lobato',
      ano: '1999'
    )
  end

  it 'adiciona livro' do
    biblioteca = Biblioteca.new

    expect {
      biblioteca.adicionar(livro)
    }.not_to raise_error
  end

  it 'localiza livro pelo isbn' do
    biblioteca = Biblioteca.new
    biblioteca.adicionar(livro)

    encontrado = biblioteca.buscar('111')

    expect(encontrado.nome).to eq('POO em Ruby')
  end
end