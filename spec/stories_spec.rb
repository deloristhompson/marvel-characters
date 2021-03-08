# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MarvelCharacters::Stories do
  context 'when requesting all stories' do
    response = described_class.all

    it 'returns 200' do
      expect(response['code']).to eq 200
    end

    it 'returns 20 stories' do
      expect(response['data']['count']).to eq(20)
    end

    it 'contains the id attribute' do
      expect(response['data']['results'][0]).to include('id')
    end
  end

  context 'when passing a single id' do
    response = described_class.find(7)

    it 'returns a single story' do
      expect(response['data']['count']).to eq(1)
    end
  end

  context 'when passing an incorrect parameter' do
    response = described_class.where(name: 'Deloris')

    it 'returns 409' do
      expect(response['code']).to eq(409)
    end

    it 'returns an error' do
      expect(response['status']).to eq("We don't recognize the parameter name")
    end
  end

  context 'when passing correct parameters' do
    response = described_class.where(events: 116)
    it 'returns a 200' do
      expect(response['code']).to eq(200)
    end

    it 'returns the correct story' do
      expect(response['data']['results'][0]['title']).to eq('Fantastic Four (1961) #334')
    end
  end
end
