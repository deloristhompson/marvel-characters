# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MarvelCharacters::Events do
  context 'when requesting all events' do
    response = described_class.all

    it 'returns 200' do
      expect(response['code']).to eq 200
    end

    it 'returns 20 events' do
      expect(response['data']['count']).to eq(20)
    end

    it 'contains the id attribute' do
      expect(response['data']['results'][0]).to include('id')
    end
  end

  context 'when passing a single id' do
    response = described_class.find(116)

    it 'returns a single event' do
      expect(response['data']['count']).to eq(1)
    end
  end

  context 'when passing an incorrect parameter' do
    response = described_class.where(title: 'ACO')

    it 'returns 409' do
      expect(response['code']).to eq(409)
    end

    it 'returns an error' do
      expect(response['status']).to eq("We don't recognize the parameter title")
    end
  end

  context 'when passing correct parameters' do
    # TODO: Make a comma separated list
    response = described_class.where(name: 'Acts of Vengeance!')
    it 'returns a 200' do
      expect(response['code']).to eq(200)
    end

    it 'returns the correct event' do
      expect(response['data']['results'][0]['title']).to eq('Acts of Vengeance!')
    end
  end
end
