class User < ApplicationRecord

  has_secure_password
  has_many :visits, dependent: :destroy 
  acts_as_paranoid without_default_scope: true

  validates :name, format: { with: /\A[a-zA-Z]+\z/, message: "ERRO: O nome deveRÁ possuir somente LETRAS" }, presence: true
  validates :password_digest, 
  format: { with: /(?=.*[a-zA-Z])(?=.*[0-9])/, message: "ERRO: a senha deve possuir somente NÚMEROS e LETRAS." },
  length: { minimum: 6, message: "A senha deve possuir no mínimo 6 caracteres." }
  validates :cpf, uniqueness: true, presence: true
  validates :cpf, cpf: true
  validates :email,
  format: { with: /\A^(.+)@(.+)$\z/, message: "E-mail inválido" },
            uniqueness: { case_sensitive: false },
            length: { minimum: 4, maximum: 254 },
            presence: true 
end	

