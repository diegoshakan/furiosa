require 'rails_helper'

RSpec.describe "addresses/index", type: :view do
  before(:each) do
    assign(:addresses, [
      Address.create!(
        cep: "Cep",
        rua: "Rua",
        numero: "Numero",
        complemento: "Complemento",
        ponto_de_referencia: "Ponto De Referencia",
        uf: "Uf",
        cidade: "Cidade",
        user: nil
      ),
      Address.create!(
        cep: "Cep",
        rua: "Rua",
        numero: "Numero",
        complemento: "Complemento",
        ponto_de_referencia: "Ponto De Referencia",
        uf: "Uf",
        cidade: "Cidade",
        user: nil
      )
    ])
  end

  it "renders a list of addresses" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Cep".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Rua".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Numero".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Complemento".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Ponto De Referencia".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Uf".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Cidade".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
