require_relative '../models/livro'

RSpec.describe Livro do
  it 'cria um livro corretamente' do
    livro = Livro.new(
      usuario: 'Carlos',
      nome: 'Ruby on Rails',
      isbn: '123',
      status: 'Em estante',
      autor: 'Monteiro Lobato',
      ano: '1999'
    )

    expect(livro.nome).to eq('Ruby on Rails')
    expect(livro.isbn).to eq('123')
  end
end