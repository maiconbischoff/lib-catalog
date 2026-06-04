require_relative 'models/biblioteca'

biblioteca = Biblioteca.new

loop do
  puts "\n===== BIBLIOTECA ====="
  puts "1 - Inserir Livro"
  puts "2 - Listar Livros"
  puts "3 - Emprestar Livro"
  puts "4 - Devolver Livro"
  puts "5 - Sair"

  opcao = gets.chomp

  case opcao

  when "1"

    puts "\nUsuário:"
    usuario = gets.chomp

    puts "Nome do Livro:"
    nome = gets.chomp

    puts "ISBN:"
    isbn = gets.chomp

    puts "\nStatus:"
    puts "1 - Em depósito"
    puts "2 - Em empréstimo"
    puts "3 - Em estante"
    puts "4 - Em leitura"

    status = case gets.chomp
             when "1" then "Em depósito"
             when "2" then "Em empréstimo"
             when "3" then "Em estante"
             when "4" then "Em leitura"
             else "Em depósito"
             end


    puts "Autor:"
    autor = gets.chomp         

    puts "Ano:"
    ano = gets.chomp         


    livro = Livro.new(
      usuario: usuario,
      nome: nome,
      isbn: isbn,
      status: status,
      autor: autor,
      ano: ano
    )

    biblioteca.adicionar(livro)

    puts "\nLivro cadastrado."

  when "2"
    biblioteca.listar

  when "3"
    puts "ISBN:"
    isbn = gets.chomp
    biblioteca.emprestar(isbn)

  when "4"
    puts "ISBN:"
    isbn = gets.chomp
    biblioteca.devolver(isbn)

  when "5"
    puts "Encerrando..."
    break

  else
    puts "Opção inválida."
  end
end