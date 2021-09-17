# encoding: utf-8
require "securerandom"

describe QueryBuilder::CQL::Operators, ".cql_literal" do

  let(:arguments) { [:cql_literal] }

  it_behaves_like :transforming_immutable_data do
    let(:input)  { nil }
    let(:output) { "NaN" }
  end

  it_behaves_like :transforming_immutable_data do
    let(:input)  { :NaN }
    let(:output) { "NaN" }
  end

  it_behaves_like :transforming_immutable_data do
    let(:input)  { "NaN" }
    let(:output) { "NaN" }
  end

  it_behaves_like :transforming_immutable_data do
    let(:input)  { :Infinity }
    let(:output) { "Infinity" }
  end

  it_behaves_like :transforming_immutable_data do
    let(:input)  { "Infinity" }
    let(:output) { "Infinity" }
  end

  it_behaves_like :transforming_immutable_data do
    let(:input)  { SecureRandom.uuid }
    let(:output) { input }
  end

  it_behaves_like :transforming_immutable_data do
    let(:input)  { "0x03" }
    let(:output) { input }
  end

  it_behaves_like :transforming_immutable_data do
    let(:input)  { 10.1 }
    let(:output) { "10.1" }
  end

  it_behaves_like :transforming_immutable_data do
    let(:input)  { true }
    let(:output) { "true" }
  end

  it_behaves_like :transforming_immutable_data do
    let(:input)  { false }
    let(:output) { "false" }
  end

  it_behaves_like :transforming_immutable_data do
    let(:input)  { :true }
    let(:output) { "'true'" }
  end

  it_behaves_like :transforming_immutable_data do
    let(:input)  { "true" }
    let(:output) { "'true'" }
  end

  it_behaves_like :transforming_immutable_data do
    let(:input)  { "d'oh!" }
    let(:output) { "'d''oh!'" }
  end

  it_behaves_like :transforming_immutable_data do
    let(:input)  { { foo: :bar, baz: "0x03", qux: { quxx: true } } }
    let(:output) { "{'foo': 'bar', 'baz': 0x03, 'qux': {'quxx': true}}" }
  end

  it_behaves_like :transforming_immutable_data do
    let(:input)  { [:foo, :bar, baz: "0x03"] }
    let(:output) { "['foo', 'bar', {'baz': 0x03}]" }
  end

  it_behaves_like :transforming_immutable_data do
    let(:input) { Time.at(1631841161.2, in: "-07:00") }
    let(:output) { "'2021-09-16T18:12:41.200-0700'" }
  end

end # describe QueryBuilder::CQL::Operators.cql_literal
