require 'rails_helper'

RSpec.describe "addresses/show", type: :view do
  before(:each) do
    assign(:address, Address.create!(
      cep: "Cep",
      rua: "Rua",
      numero: "Numero",
      complemento: "Complemento",
      ponto_de_referencia: "Ponto De Referencia",
      uf: "Uf",
      cidade: "Cidade",
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Cep/)
    expect(rendered).to match(/Rua/)
    expect(rendered).to match(/Numero/)
    expect(rendered).to match(/Complemento/)
    expect(rendered).to match(/Ponto De Referencia/)
    expect(rendered).to match(/Uf/)
    expect(rendered).to match(/Cidade/)
    expect(rendered).to match(//)
  end
end
