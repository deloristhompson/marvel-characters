# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MarvelCharacters::Series do
  context 'when requesting all series' do
    response = described_class.all

    it 'returns 200' do
      expect(response['code']).to eq 200
    end

    it 'returns 20 series' do
      expect(response['data']['count']).to eq(20)
    end

    it 'contains the id attribute' do
      expect(response['data']['results'][0]).to include('id')
    end
  end

  context 'when passing a single id' do
    response = described_class.find(31_445)

    it 'returns a single series' do
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
    response = described_class.where(titleStartsWith: 'Superior Spider-Man Vol. 2')
    it 'returns a 200' do
      expect(response['code']).to eq(200)
    end

    it 'returns the correct series' do
      expect(response['data']['results'][0]['title']).to eq('SUPERIOR SPIDER-MAN VOL. 2: A TROUBLED MIND TPB (MARVEL NOW) (2013)')
    end
  end
end
