require 'rails_helper'

RSpec.describe "addresses/new", type: :view do
  before(:each) do
    assign(:address, Address.new(
      cep: "MyString",
      rua: "MyString",
      numero: "MyString",
      complemento: "MyString",
      ponto_de_referencia: "MyString",
      uf: "MyString",
      cidade: "MyString",
      user: nil
    ))
  end

  it "renders new address form" do
    render

    assert_select "form[action=?][method=?]", addresses_path, "post" do

      assert_select "input[name=?]", "address[cep]"

      assert_select "input[name=?]", "address[rua]"

      assert_select "input[name=?]", "address[numero]"

      assert_select "input[name=?]", "address[complemento]"

      assert_select "input[name=?]", "address[ponto_de_referencia]"

      assert_select "input[name=?]", "address[uf]"

      assert_select "input[name=?]", "address[cidade]"

      assert_select "input[name=?]", "address[user_id]"
    end
  end
end
