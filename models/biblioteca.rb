require 'json'
require_relative 'livro'

class Biblioteca
  ARQUIVO = 'data/livros.json'

  def initialize
    @livros = carregar
  end

  def adicionar(livro)
    @livros << livro
    salvar
  end

  def listar
    @livros.each_with_index do |livro, i|
      puts "#{i + 1} - #{livro.nome}"
      puts "Usuário: #{livro.usuario}"
      puts "ISBN: #{livro.isbn}"
      puts "Status: #{livro.status}"
      puts "Autor: #{livro.autor}"
      puts "Ano: #{livro.ano}"
      puts "-" * 30
    end
  end

  def emprestar(isbn)
    livro = buscar(isbn)

    if livro
      livro.status = "Em empréstimo"
      salvar
      puts "Livro emprestado."
    else
      puts "Livro não encontrado."
    end
  end

  def devolver(isbn)
    livro = buscar(isbn)

    if livro
      livro.status = "Em estante"
      salvar
      puts "Livro devolvido."
    else
      puts "Livro não encontrado."
    end
  end

  def buscar(isbn)
    @livros.find { |l| l.isbn == isbn }
  end

  private

  def salvar
    dados = @livros.map(&:to_hash)

    File.write(
      ARQUIVO,
      JSON.pretty_generate(dados)
    )
  end

  def carregar
    return [] unless File.exist?(ARQUIVO)

    JSON.parse(File.read(ARQUIVO)).map do |item|
      Livro.new(
        usuario: item["usuario"],
        nome: item["nome"],
        isbn: item["isbn"],
        status: item["status"],
        autor: item["autor"],
        ano: item["ano"]
      )
    end
  end
end