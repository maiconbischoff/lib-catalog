class Livro
  attr_accessor :usuario, :nome, :isbn, :status, :autor, :ano

  STATUS_VALIDOS = [
    "Em depósito",
    "Em empréstimo",
    "Em estante",
    "Em leitura"
  ]

  def initialize(usuario:, nome:, isbn:, status:, autor:, ano:)
    @usuario = usuario
    @nome = nome
    @isbn = isbn
    @status = status
    @autor = autor
    @ano = ano
  end

  def to_hash
    {
      usuario: usuario,
      nome: nome,
      isbn: isbn,
      status: status,
      autor: autor,
      ano: ano
    }
  end
end