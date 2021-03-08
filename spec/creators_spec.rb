# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MarvelCharacters::Creators do
  context 'when requesting all creators' do
    response = described_class.all

    it 'returns 200' do
      expect(response['code']).to eq 200
    end

    it 'returns 20 creators' do
      expect(response['data']['count']).to eq(20)
    end

    it 'contains the id attribute' do
      expect(response['data']['results'][0]).to include('id')
    end
  end

  context 'when passing a single id' do
    response = described_class.find(13_970)

    it 'returns a single creator' do
      expect(response['data']['count']).to eq(1)
    end
  end

  context 'when passing an incorrect parameter' do
    response = described_class.where(name: 'ACO')

    it 'returns 409' do
      expect(response['code']).to eq(409)
    end

    it 'returns an error' do
      expect(response['status']).to eq("We don't recognize the parameter name")
    end
  end

  context 'when passing correct parameters' do
    response = described_class.where(firstName: 'ACO')
    it 'returns a 200' do
      expect(response['code']).to eq(200)
    end

    it 'returns the correct creator' do
      expect(response['data']['results'][0]['firstName']).to eq('ACO')
    end
  end
end
