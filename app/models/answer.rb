class answer < ApplicationRecord

    belongs_to :formulary
    belongs_to :question
    belongs_to :visit
    validates :content, presence: true
    validates :question_id, presence: true
    validates :formulary_id, presence: true
    validate :question_is_valid?
    validate :formulary_is_valid?

    def question_is_valid?
      if !Question.exists?(question_id)
        errors.add(:question_id, "Essa pergunta não foi encontrada")
      end
    end

    def formulary_is_valid?
      if !Formulary.exists?(formulary_id)
        errors.add(:formulary_id, "Esse formulário não foi encontrado")
      end
    end

end